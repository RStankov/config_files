<?php

require_once( 'Alphred.phar' );
require_once( 'languageCodes.php' );

$arg = $argv[1];
$alphred = new Alphred([ 'config_handler' => 'json' ]);
$languages = $alphred->config_read( 'languages' );

if ( preg_match( '/^(en|dis)able/', $arg ) ) {
	$action = substr( $arg, 0, strpos( $arg, '-' ) );
	$code = str_replace( $action . '-', '', $arg );
	$name = $codes[ $code ];

	if ( $action == 'enable' ) {
		if ( ! in_array( $name, $languages ) )
			$languages[ $code ] = $name;
	} else if ( $action == 'disable' ) {
		if ( in_array( $name, $languages ) ) {
			unset( $languages[ $code ] );
		}
	}
	$alphred->config_set( 'languages', $languages );
} else {
	echo $arg;
}