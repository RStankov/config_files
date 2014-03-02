<?php
/*
	Please help by translating this file into your own language!

	1. Make a copy of this file.

	2. Name the copy with an ISO language-code:
		"en" for English
		"en-GB" for British English
		"de" for German
		"fr" for French
		"pt-BR" for Brazilian Portuguese
	   More codes here: http://www.loc.gov/standards/iso639-2/php/code_list.php

	3. Change the parts AFTER THE '=>' symbols to your language.
	   Do NOT change the parts BEFORE the '=>' symbols!

		e.g. "tomorrow" => "demain" // fr
			 "year" => "jahr" // de

	4. Make sure you translate ALL sections.

	5. Send the translation to me. Contact info: http://mattgemmell.com/about
*/


// Specify the order you use for days, months and years in dates.
// Use d for day, m for month, y for year.
$date_input_order = "dmy"; // day, month and year input order (delimiters don't matter)
$date_output_format = "%e %B, %Y"; // use PHP 'strftime' (not 'date') format

$tenses = array(
	"is" => "ist",
	"was" => "war",
	"will be" => "sein",
	"yesterday" => "gestern",
	"today" => "heute",
	"tomorrow" => "morgen",
);

$nouns = array(
	"day" => "Tag",
	"days" => "Tage",
	"week" => "Woche",
	"weeks" => "Wochen",
	"month" => "Monat",
	"months" => "Monate",
	"year" => "Jahr",
	"years" => "Jahre",
);

?>