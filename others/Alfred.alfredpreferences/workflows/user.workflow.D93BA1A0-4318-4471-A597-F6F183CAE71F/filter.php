<?php

require_once( 'Alphred.phar' );
require_once( 'languageCodes.php' );

$alphred = new Alphred([ 'config_handler' => 'json' ]);

$data = \Alphred\Globals::data();

$languages = $alphred->config_read( 'languages' );
if ( empty( $languages ) ) {
	$languages = [
		'fr' => 'French',
		'el' => 'Greek',
		'de' => 'German'
	];
	$alphred->config_set( 'languages', $languages );
}

if ( ( ! isset( $argv[1] ) ) || ( empty( $argv[1] ) ) ) {
	$alphred->add_result([
		'title' => 'Type to translate...',
		'valid' => false,
	]);
	$alphred->add_result([
		'title'        => 'Enable / Disable Languages',
		'autocomplete' => '.configure',
		'valid'        => false,
	]);
	print $alphred->to_xml();
	exit(0);
}

if ( 0 === strpos( $argv[1], '.configure' ) ) {
	$filter = trim( str_replace( '.configure', '', $argv[1] ) );

	foreach ( $codes as $code => $name) :
		if ( ! empty( $filter ) ) {
			if ( false !== stripos( $name, $filter ) ) {
				if ( in_array( $name, $languages ) ) {
					$alphred->add_result([
						'title'    => "Disable {$name}",
						'icon'     => 'icons/check.png',
						'valid'    => true,
						'arg'      => "disable-{$code}",
						'subtitle' => "{$name} ({$code})",
					]);
				} else {
					$alphred->add_result([
						'title'    => "Enable {$name}",
						'icon'     => 'icons/cancel.png',
						'valid'    => true,
						'arg'      => "enable-{$code}",
						'subtitle' => "{$name} ({$code})",
					]);
				}
			}
		} else if ( in_array( $name, $languages ) ) {
			$alphred->add_result([
				'title'    => "Disable {$name}",
				'icon'     => 'icons/check.png',
				'valid'    => true,
				'arg'      => "disable-{$code}",
				'subtitle' => "{$name} ({$code})",
			]);
		} else {
			$alphred->add_result([
				'title'    => "Enable {$name}",
				'icon'     => 'icons/cancel.png',
				'valid'    => true,
				'arg'      => "enable-{$code}",
				'subtitle' => "{$name} ({$code})",
			]);
		}
	endforeach;

	print $alphred->to_xml();
	exit(0);
}
$text = $argv[1];

foreach ( $languages as $code => $name ) :
	// Construct the very long query.
	$query =  "http://translate.google.com/translate_a/single?client=json&ie=UTF-8&oe=UTF-8";
	$query .= "&dt=bd&dt=ex&dt=ld&dt=md&dt=qca&dt=rw&dt=rm&dt=ss&dt=t&dt=at";
	$query .= "&q=" . urlencode( $text );
	$query .= "&hl=en&sl=auto&";
	$query .= "tl=" . $code;

	// Grab the information from Google Translate and cache it for about a month.
	$trans = $alphred->get( $query, [ 'useragent' => 'alfredworkflow' ], 2419200, true );

	// Google gives us something that looks like garbled JSON. So, let's fix it.
	while ( false !== strpos( $trans, '[,' ) ) :
		$trans = str_replace( '[,', '[null,', $trans );
	endwhile;
	while ( false !== strpos( $trans, ',,' ) ) :
		$trans = str_replace( ',,', ',null,', $trans );
	endwhile;
  $trans = json_decode( $trans, true );
	$string = '';
	foreach ( $trans[0] as $t ) :
		$string .= trim( $t[0] ) . ' ';
	endforeach;
	$alphred->add_result([
		'title'    => str_replace("\n", ' ', $string),
		'subtitle' => "{$name}: {$text}",
		'icon' => "icons/{$code}.png",
		'arg'      => $string,
		'valid'    => true,
	]);
endforeach;

print $alphred->to_xml();
exit(0);