<?php
// begin settings needed for nest-api
define('USERNAME', 'Nest username');
define('PASSWORD', 'Nest password');
// your timezone @see http://php.net/manual/en/timezones.php
date_default_timezone_set('America/Los_Angeles');
// end settings needed for nest-api

// the URL to your ControlByWeb temperature module's XML page
$temperature_module_url = "http://path/to/temperature/module/state.xml";

// Your wunderground station ID
$wunderground_id = "wunderground station id";
// Your wunderground password
$wunderground_pwd = "wunderground password";
