<?php
const MAX_DAY = 31;
const MAX_MONTH = 12;

require( 'workflows.php' ); // by David Ferguson
$w = new Workflows();

// Grab the input and trim any surrounding whitespace.
$in = trim( @$argv[1] );

// Load appropriate language.
if (count($argv) > 2) {
	$override_locale = trim( $argv[2] );
	if (strlen($override_locale) > 0) { // should be at least 2 characters
		$lang = $override_locale;
	}
}
if (!$lang || strlen($lang) == 0) {
	$lang = get_osx_system_locale(true);
}
setlocale(LC_ALL, $lang); // at least override output functions
if (!file_exists("lang/$lang.php")) {
	unset($lang);
}
if (!$lang || strlen($lang) == 0) {
	// Default to American English.
	$lang = "en_US";
}
require( "lang/$lang.php" );

// Parse input. First, default to today.
$timestamp = time();
$today_day = (int)@date("j", $timestamp);
$today_month = (int)@date("n", $timestamp);
$today_year = (int)@date("Y", $timestamp);
$result = 0;

// Determine and resolve ambiguities.
/*
	Expected input:
	* (nothing) = today
	* 7 = date of current month (if sane), or today in given year (if sane)
	* 5/6 = day & month in current year (if sane), order locale-dependent
	* 4/5/6 = day, month, year (if sane), order locale-dependent
*/

$numbers = preg_match_all("/[0-9]+/i", $in, $matches);

if ($numbers > 0) {
	// We've received some numeric input. Try to work out what it means.
	if ($numbers == 1) {
		// This might be a day in the current month, or a year.
		$val = $matches[0][0];
		if ($val > MAX_DAY) {
			// We'll assume it's a year. Ensure it's four digits.
			add_result($w, $today_day, $today_month, four_digit_year($val));
			
		} else {
			// We'll assume it's a day.
			$adjusted_month = $today_month;
			if ($val < $today_day) {
				// The user probably means next month, so offer that option first.
				$adjusted_month = month_delta($today_month, 1);
				add_result($w, $val, $adjusted_month, $today_year);
			}
			// Show that day in the current month.
			add_result($w, $val, $today_month, $today_year);
			
			// ... but there's a chance they also meant it as a year.
			add_result($w, $today_day, $today_month, four_digit_year($val));
		}
		
	} else if ($numbers == 2) {
		// Two numbers. Probably day and month (in some order).
		// Might be today's date in a given month and year (in some order).
		// Unlikely to be day and year (ambiguous month).
		// If either number looks like a year, we'll assume month & year.
		// Else, we'll assume day & month (in the current or next year),
		// and take the order from date_input_order.
		$val1 = $matches[0][0];
		$val2 = $matches[0][1];
		//echo $val1." ".$val2.PHP_EOL;
		$day = $today_day;
		$month = $today_month;
		$year = $today_year;
		if ($val1 > MAX_DAY || $val2 > MAX_DAY) {
			// Assume it's a year, and either a month or day.
			if ($val1 > MAX_DAY) {
				$year = $val1;
				$other = $val2;
			} else {
				$year = $val2;
				$other = $val1;
			}
			
			if ($other > MAX_MONTH) {
				// The other param is a day.
				add_result($w, $other, $month, four_digit_year($year));
			} else {
				// The other param might be a day or a month.
				add_result($w, $day, $other, four_digit_year($year));
				add_result($w, $other, $month, four_digit_year($year));
			}
			
		} else {
			// Assume we have a day and month, in some order.
			if ($val1 > MAX_MONTH || $val2 > MAX_MONTH) {
				if ($val1 > MAX_MONTH) {
					$day = $val1;
					$month = $val2;
				} else {
					$day = $val2;
					$month = $val1;
				}
				add_result($w, $day, $month, four_digit_year($year));
				
			} else {
				// Ambiguous day/month; assume locale-specific ordering;
				$dayFirst = false;
				$dayPosn = strpos($date_input_order, "d");
				$monthPosn = strpos($date_input_order, "m");
				if ($dayPosn !== false && $monthPosn !== false) {
					$dayFirst = ($dayPosn < $monthPosn);
				}
				//echo (($dayFirst) ? "day first" : "month first").PHP_EOL;
				
				// Add both variants.
				if ($dayFirst) {
					add_result($w, $val1, $val2, four_digit_year($year));
					add_result($w, $val2, $val1, four_digit_year($year));
				} else {
					add_result($w, $val2, $val1, four_digit_year($year));
					add_result($w, $val1, $val2, four_digit_year($year));
				}
			}
		}
		
	} else {
		// At least 3 numbers. We'll use the first three.
		// We assume they're day, month and year (in some order),
		// likely corresponding to date_input_order.
		$vals = array($matches[0][0], $matches[0][1], $matches[0][2]);
		
		// Use date_input_order, checking if it's valid first.
		$default_order = "mdy";
		$day_posn = strpos($date_input_order, 'd');
		$month_posn = strpos($date_input_order, 'm');
		$year_posn = strpos($date_input_order, 'y');
		if ($day_posn === false || $month_posn === false || $year_posn === false) {
			$date_input_order = $default_order;
		}
		$num_tokens = preg_match_all("/[dmy]/i", $date_input_order, $positions);
		for ($i = 0; $i < $num_tokens; $i++) {
			if ($positions[0][$i] == "d") {
				$day = $vals[$i];
			} else if ($positions[0][$i] == "m") {
				$month = $vals[$i];
			} else {
				$year = $vals[$i];
			}
		}
		//echo "d:$day m:$month y:".four_digit_year($year).PHP_EOL;
		add_result($w, $day, $month, four_digit_year($year));
	}
	
} else {
	// Show today's date.
	add_result($w, $today_day, $today_month, four_digit_year($today_year));
}

// Send results back to Alfred.
echo $w->toxml();


// -- Functions --

function day_names($abbreviated = false) {
	$day_names = array();
	$token = (($abbreviated) ? "a" : "A");
	for ($n = 0, $t = (3 + $first_day) * 86400; $n < 7; $n++, $t += 86400) {
		$day_names[$n] = ucfirst(@strftime('%'.$token, $t));
	}
	return $day_names;
}

function add_result($workflow, $theDay, $theMonth, $theYear) {
	global $today_day, $today_month, $today_year;
	global $tenses, $date_output_format;
	global $result;
	
	// http://www.php.net/manual/en/datetime.createfromformat.php
	$datetime = @DateTime::createFromFormat('Y-n-j', "$theYear-$theMonth-$theDay");
	$today_datetime = @DateTime::createFromFormat('Y-n-j', "$today_year-$today_month-$today_day");
	$theTimestamp = @mktime(0, 0, 0, $theMonth, $theDay, $theYear);
	$weekday = @strftime("%A", $theTimestamp);
	$weekday_abbrev = @strftime("%a", $theTimestamp);
	$full_date = trim( @strftime($date_output_format, $theTimestamp) );
	
	// Modify full-date if it's a nearby date, e.g. today.
	$date_description = $full_date;
	$delta_days = $datetime->diff($today_datetime)->days;
	if ($datetime < $today_datetime) {
		$delta_days = -$delta_days;
	}
	if ($delta_days == 1) {
		$date_description = ucfirst($tenses['tomorrow'])." ($full_date)";
	} else if ($delta_days == -1) {
		$date_description = ucfirst($tenses['yesterday'])." ($full_date)";
	} else if ($delta_days == 0) {
		$date_description = ucfirst($tenses['today'])." ($full_date)";
	}
	
	// Determine temporally appropriate verb tense.
	$verb = $tenses['will be'];
	if ($delta_days == 0) {
		$verb = $tenses['is'];
	} else if ($delta_days < 0) {
		$verb = $tenses['was'];
	}
	
	$description = "$date_description $verb $weekday";
	$argument = "$weekday $full_date";
	
	$workflow->result( $result.$full_date, $argument, $description, $argument, day_image($weekday_abbrev), 'yes' );
	$result++;
}

function month_delta($theMonth, $delta) {
	$theMonth += $delta;
	if ($theMonth > MAX_MONTH) {
		$theMonth = ($theMonth % MAX_MONTH);
	}
	return $theMonth;
}

function four_digit_year($yr) {
	global $today_year;
	if ($yr < 100) {
		// Make it into a four-digit year.
		$yr += (100 * (floor($today_year / 100)));
	}
	return $yr;
} 

function day_image($day_abbrev) {
	// Generate a calendar-icon with day-abbreviation superimposed.
	// Returns the relative path to the image.
	global $lang;
	
	$dir = "./icons/generated/"; // where icons are created
	$template = "./icons/blank.png"; // base template image
	$font = "./icons/alte_haas_grotesk/AlteHaasGroteskBold.ttf"; // TTF font for text
	$size = 34; // font size
	$x_offset = 0; // text horizontal offset from center (- left / + right)
	$y_offset = 10; // text vertical offset from center (- up / + down)
	$text_colour = array('r' => 0, 'g' => 0, 'b' => 0);
	$always_create = false; // if true, overwrite any existing image
	
	// Ensure the 'generated' subfolder of 'icons' exists.
	if (!file_exists($dir)) {
		mkdir($dir, 0777, true);
	}
	
	// Determine if a suitable image exists, and create it if not.
	$path = $dir.$lang."_".strtolower($day_abbrev).".png";
	if ($always_create || !file_exists($path)) {
		// Create an appropriate image.
		$im = imagecreatefrompng($template);
		imagealphablending($im, false);
		$angle = 0;
		$box = imageftbbox($size, $angle, $font, $day_abbrev);
		$box_width = floor($box[4] - $box[6]);
		$box_height = floor($box[1] - $box[7]);
		$x = floor((imagesx($im) - $box_width) / 2);
		$x += $x_offset;
		$y = floor((imagesy($im) - $box_height) / 2);
		$y += $box_height; // compensate for text-drawing origin system.
		$y += $y_offset;
		$colour = imagecolorallocate($im, $text_colour['r'], $text_colour['g'], $text_colour['b']);
		imagealphablending($im, true);
		imagefttext($im, $size, $angle, $x, $y, $colour, $font, $day_abbrev);
		imagealphablending($im, false);
		imagesavealpha($im, true);
		imagepng($im, $path);
		imagedestroy($im);
	}
	
	return $path;
}

// Obtain the system's current preferred locale.
function get_osx_system_locale($full = false) {
	// If $full is true, you MIGHT get locales like "en-US", or just "en".
	// If $full is false, you'll ALWAYS get locales like just "en".
	
	$lang = "en";
	$raw_locs = array();
	exec('defaults read .GlobalPreferences AppleLanguages | tr -d [:space:]', $raw_locs);
	
	$locs_str = trim($raw_locs[0], "()");
	$locs = explode(",", $locs_str);
	$locale = trim($locs[0], "\"");
	$locale = str_replace("-", "_", $locale);
	
	// Special case.
	if (strtolower($locale) == "en_uk") {
		$locale = "en_GB"; // proper form
	}
	
	// Most OS X locales are country-only, and don't work with strftime.
	$replacements = array (
		"en" => "en_US",
		"fr" => "fr_FR",
		"de" => "de_DE",
		"ja" => "ja_JP",
		"es" => "es_ES",
		"it" => "it_IT",
		"pt" => "pt_PT",
		"nl" => "nl_NL",
		"sv" => "sv_SE",
		"nb" => "nb_NO",
		"da" => "da_DK",
		"fi" => "fi_FI",
		"ru" => "ru_RU",
		"pl" => "pl_PL",
	);
	$delim_posn = strpos($locale, "_");
	if ($delim_posn === false) {
		// Attempt to expand the locale code.
		foreach ($replacements as $brief => $full) {
			if ($locale == $brief) {
				$locale = $full;
				break;
			}
		}
	}
	
	if (!$full) {
		// Strip language variant.
		if ($delim_posn !== false) {
			$lang = substr($locale, 0, $delim_posn);
		}
	}
	
	return $locale;
}

/*
TODO:
- Allow input of word-prefixes for months, as well as digits?
- Allow "+/- 3 days/weeks/months/years"?
*/
?>