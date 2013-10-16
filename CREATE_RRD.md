# Create the rrd file that stores the temperature data by calling this from the command line (replace `filename.rrd` with whatever you want to name it)

```
rrdtool create filename.rrd \
--step '300' \
'DS:outside:GAUGE:600:0:U' \
'DS:inside1:GAUGE:600:0:U' \
'DS:inside2:GAUGE:600:0:U' \
'DS:inside3:GAUGE:600:0:U' \
'DS:nest1:GAUGE:600:0:U' \
'RRA:AVERAGE:0.5:1:2016' \
'RRA:AVERAGE:0.5:1:4032' \
'RRA:AVERAGE:0.5:6:1440' \
'RRA:AVERAGE:0.5:6:4416' \
'RRA:AVERAGE:0.5:12:4392' \
'RRA:AVERAGE:0.5:24:4380' \
'RRA:AVERAGE:0.5:48:4380'
```

# The rrd translated into simpler terms  (thanks to http://www.famzah.net/rrdwizard/import.php)

```
Available data sources (input data)
Data source:	outside (GAUGE)
Data source:	inside1 (GAUGE)
Data source:	inside2 (GAUGE)
Data source:	inside3 (GAUGE)
Data source:	nest1 (GAUGE)

Available archives for each data source (this is what you can visualize)
AVERAGE:	Archive point is saved every 5min, archive is kept for 7day back.
AVERAGE:	Archive point is saved every 5min, archive is kept for 14day back.
AVERAGE:	Archive point is saved every 30min, archive is kept for 30day back.
AVERAGE:	Archive point is saved every 30min, archive is kept for 3month back.
AVERAGE:	Archive point is saved every 1hour, archive is kept for 6month back.
AVERAGE:	Archive point is saved every 2hour, archive is kept for 1year back.
AVERAGE:	Archive point is saved every 4hour, archive is kept for 2year back.
```