temperature-graphing
====================
A project to graph temperature data from the [ControlByWeb temperature module](http://www.controlbyweb.com/temperature/) and the Nest Thermostat into rrdtool. Nest Thermostat data retrieved via [nest-api](https://github.com/gboudreau/nest-api). Send your temperature reading to the Weather Underground [Personal Weather Station](http://www.wunderground.com/weatherstation/about.asp) network as well.

Blog post [here](http://www.normyee.net/blog/2013/10/10/graphing-temperatures-from-1-wire-sensors-and-the-nest-thermostat-in-rrdtool/).

Getting started
===============
After you clone this repo, run a `git submodule init` then `git submodule update` to get the nest-api submodule checked out as well (files will be under `vendor/nest-api`)


In `temperature.php` enter the following info:

* Your Nest login & password.
* The url to the temperature module's XML status page
* Your wunderground PWS station ID & password

Create your temperature RRD (see [CREATE_RRD.md](CREATE_RRD.md))

Set up 2 cronjobs to run the polling and graphing scripts
```
*/5 * * * * php -f /path/to/temperatures.php | xargs /path/to/rrdupdate /path/to/temperatures.rrd
*/2 * * * * /path/to/create_graph.sh >/dev/null 2>&1
```
