<?php
/*
 * Concept 			Design and such
 * Developper		Thijs de Jong
 * url 				www.designandsuch.com
 * contact 			info@designandsuch.com
 */

function units($query = null)
{
	$postfields = array(
			'query' => json_encode($query),
			'v' 	=> '0.6'
		);

	$post_string_count = 2;

	$url = 'http://time.designandsuch.com/units/one/';
	
	$defaults = array(
		CURLOPT_RETURNTRANSFER => true,
		CURLOPT_URL => $url,
		CURLOPT_FRESH_CONNECT => true,

		CURLOPT_POST => $post_string_count,
		CURLOPT_POSTFIELDS => $postfields,
	);

	$ch  = curl_init();
	curl_setopt_array($ch, $defaults);
	$out = curl_exec($ch);
	$err = curl_error($ch);
	curl_close($ch);

	$result = '<?xml version="1.0" encoding="utf-8"?><items>';

	$json = json_decode($out);

	if (isset($json->items)) {
		foreach ($json->items as $item) {
			$result .= $item;
		}
	}else { 
		$result .= '<item uid="mtranslate">';
		$result .= '<title>Units fail</title>';
		$result .= '<icon>Icons/error.png</icon>';
		$result .= '</item>';
	}

	$result .= '</items>';
	echo $result;
}
