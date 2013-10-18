#!/usr/bin/php
<?php
require_once('config.inc.php');
require_once('vendor/nest-api/nest.class.php');

$ch = curl_init();
curl_setopt($ch, CURLOPT_URL, $temperature_module_url);
curl_setopt($ch, CURLOPT_HEADER, 0);
curl_setopt($ch, CURLOPT_RETURNTRANSFER, TRUE); 
$res = curl_exec($ch);
curl_close($ch);

// parse the XML from the temperature module
$xml_temperatures = @simplexml_load_string($res);

// set some defaults for rrd in case we can't get the temperature data
$indoor_temp1 = "U";
$indoor_temp2 = "U";
$indoor_temp3 = "U";
$outdoor_temp = "U";
$nest1_temp   = "U";

if ($xml_temperatures) {
	$indoor_temp1 = sprintf("%.1f", $xml_temperatures->sensor1temp);
	$indoor_temp2 = sprintf("%.1f", $xml_temperatures->sensor2temp);
	$indoor_temp3 = sprintf("%.1f", $xml_temperatures->sensor3temp);
	$outdoor_temp = sprintf("%.1f", $xml_temperatures->sensor4temp);
}

// instantiate the nest-api class
$nest = new Nest();
// get the device info, where the current temp is stored
$device = $nest->getDeviceInfo();

if ($device) {
	// get the current temp of the Nest Thermostat
	$nest1_temp = sprintf("%.1f", $device->current_state->temperature);
}

// output data in a format that rrdtool understands, eg:
// N:79.0:77.7:83.7:77.0:73.7
echo "N:" . $outdoor_temp . ":" . $indoor_temp1 . ":" . $indoor_temp2 . ":" . $indoor_temp3 . ":" . $nest1_temp ."\n";

///////////////////////////////////////////////////////////////////////
// Begin update wunderground
///////////////////////////////////////////////////////////////////////

if ($outdoor_temp == "U") {
	// if the outdoor temperature wasn't able to be parsed, don't update weather underground
	return;
}

// create Weather Underground URL

// wunderground station ID
$wunderground_id = urlencode($wunderground_id);
// wunderground password
$wunderground_pwd = urlencode($wunderground_pwd);
// UTC timestamp
$wunderground_timestamp = urlencode(gmdate('Y-m-d H:i:s'));
// temperature value to upload
$wunderground_temperature = urlencode($outdoor_temp);
// build the URL
$wunderground_url = sprintf("http://weatherstation.wunderground.com/weatherstation/updateweatherstation.php?action=updateraw&ID=%s&PASSWORD=%s&dateutc=%s&tempf=%s", 
	$wunderground_id, 
	$wunderground_pwd, 
	$wunderground_timestamp, 
	$wunderground_temperature); 

$ch2 = curl_init();
curl_setopt($ch2, CURLOPT_URL, $wunderground_url);
curl_setopt($ch2, CURLOPT_HEADER, 0);
curl_setopt($ch2, CURLOPT_RETURNTRANSFER, TRUE); 
$res2 = curl_exec($ch2);
curl_close($ch2);
///////////////////////////////////////////////////////////////////////
// End update wunderground
///////////////////////////////////////////////////////////////////////
