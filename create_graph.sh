#!/bin/bash

IMAGE_PATH="/PATH/TO/WEB/DIRECTORY/"
RRD_PATH="/PATH/TO/RRD/FILE.rrd"

#
#  hourly (24 hour) graph
#
rrdtool graph "$IMAGE_PATH/hourly.png" \
--title 'temperature (24 hour)' \
--vertical-label 'degrees (F)' \
--width '1200' \
--height '350' \
--full-size-mode \
--start end-1d \
--x-grid MINUTE:30:HOUR:1:HOUR:1:0:%l%p \
--y-grid 5:1 \
--right-axis 1:0 \
--slope-mode \
-P \
"DEF:outside=$RRD_PATH:outside:AVERAGE" \
"DEF:inside1=$RRD_PATH:inside1:AVERAGE" \
"DEF:inside2=$RRD_PATH:inside2:AVERAGE" \
"DEF:inside3=$RRD_PATH:inside3:AVERAGE" \
"DEF:nest1=$RRD_PATH:nest1:AVERAGE" \
'VDEF:out_avg=outside,AVERAGE' \
'VDEF:out_cur=outside,LAST' \
'VDEF:out_min=outside,MINIMUM' \
'VDEF:out_max=outside,MAXIMUM' \
'VDEF:in1_avg=inside1,AVERAGE' \
'VDEF:in1_cur=inside1,LAST' \
'VDEF:in1_min=inside1,MINIMUM' \
'VDEF:in1_max=inside1,MAXIMUM' \
'VDEF:in2_avg=inside2,AVERAGE' \
'VDEF:in2_cur=inside2,LAST' \
'VDEF:in2_min=inside2,MINIMUM' \
'VDEF:in2_max=inside2,MAXIMUM' \
'VDEF:in3_avg=inside3,AVERAGE' \
'VDEF:in3_cur=inside3,LAST' \
'VDEF:in3_min=inside3,MINIMUM' \
'VDEF:in3_max=inside3,MAXIMUM' \
'VDEF:nest1_avg=nest1,AVERAGE' \
'VDEF:nest1_cur=nest1,LAST' \
'VDEF:nest1_min=nest1,MINIMUM' \
'VDEF:nest1_max=nest1,MAXIMUM' \
'VRULE:in1_max#0000FF' \
'VRULE:in2_max#00CC00' \
'VRULE:in3_max#CC0000' \
'VRULE:out_max#FFCC00' \
COMMENT:"\t\t\t\t  <b>Current</b>\t\t    <b>Avg</b>\t\t   <b>Min</b>\t\t  <b>Max</b>\l" \
COMMENT:"\t" \
'LINE1:outside#00DD00FF' \
'AREA:outside#00FF0044:outside\t' \
'GPRINT:out_cur:%6.1lf F\t' \
'GPRINT:out_avg:%6.1lf F\t' \
'GPRINT:out_min:%6.1lf F\t' \
'GPRINT:out_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside1#0000FF99:attic cntr\t' \
'GPRINT:in1_cur:%6.1lf F\t' \
'GPRINT:in1_avg:%6.1lf F\t' \
'GPRINT:in1_min:%6.1lf F\t' \
'GPRINT:in1_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside2#00CC0099:attic rear\t' \
'GPRINT:in2_cur:%6.1lf F\t' \
'GPRINT:in2_avg:%6.1lf F\t' \
'GPRINT:in2_min:%6.1lf F\t' \
'GPRINT:in2_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE1:inside3#CC000077:garage \t' \
'GPRINT:in3_cur:%6.1lf F\t' \
'GPRINT:in3_avg:%6.1lf F\t' \
'GPRINT:in3_min:%6.1lf F\t' \
'GPRINT:in3_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:nest1#00000066:nest   \t' \
'GPRINT:nest1_cur:%6.1lf F\t' \
'GPRINT:nest1_avg:%6.1lf F\t' \
'GPRINT:nest1_min:%6.1lf F\t' \
'GPRINT:nest1_max:%6.1lf F\l' \
"COMMENT: generated $(/bin/date "+%D %l:%M:%S %p" | sed 's/:/\\:/g')\r" \

#
# daily (7 day) graph
#
rrdtool graph "$IMAGE_PATH/daily.png" \
--title 'temperature (7 day)' \
--vertical-label 'degrees (F)' \
--width '1200' \
--height '350' \
--full-size-mode \
--start end-1w \
--x-grid HOUR:12:HOUR:24:HOUR:24:86400:"%a %m/%d" \
--y-grid 5:1 \
--right-axis 1:0 \
--slope-mode \
-P \
"DEF:outside=$RRD_PATH:outside:AVERAGE" \
"DEF:inside1=$RRD_PATH:inside1:AVERAGE" \
"DEF:inside2=$RRD_PATH:inside2:AVERAGE" \
"DEF:inside3=$RRD_PATH:inside3:AVERAGE" \
"DEF:nest1=$RRD_PATH:nest1:AVERAGE" \
'VDEF:out_avg=outside,AVERAGE' \
'VDEF:out_cur=outside,LAST' \
'VDEF:out_min=outside,MINIMUM' \
'VDEF:out_max=outside,MAXIMUM' \
'VDEF:in1_avg=inside1,AVERAGE' \
'VDEF:in1_cur=inside1,LAST' \
'VDEF:in1_min=inside1,MINIMUM' \
'VDEF:in1_max=inside1,MAXIMUM' \
'VDEF:in2_avg=inside2,AVERAGE' \
'VDEF:in2_cur=inside2,LAST' \
'VDEF:in2_min=inside2,MINIMUM' \
'VDEF:in2_max=inside2,MAXIMUM' \
'VDEF:in3_avg=inside3,AVERAGE' \
'VDEF:in3_cur=inside3,LAST' \
'VDEF:in3_min=inside3,MINIMUM' \
'VDEF:in3_max=inside3,MAXIMUM' \
'VDEF:nest1_avg=nest1,AVERAGE' \
'VDEF:nest1_cur=nest1,LAST' \
'VDEF:nest1_min=nest1,MINIMUM' \
'VDEF:nest1_max=nest1,MAXIMUM' \
'VRULE:in1_max#0000FF' \
'VRULE:in2_max#00CC00' \
'VRULE:in3_max#CC0000' \
'VRULE:out_max#FFCC00' \
COMMENT:"\t\t\t\t  <b>Current</b>\t\t    <b>Avg</b>\t\t   <b>Min</b>\t\t  <b>Max</b>\l" \
COMMENT:"\t" \
'LINE1:outside#00DD00FF' \
'AREA:outside#00FF0044:outside\t' \
'GPRINT:out_cur:%6.1lf F\t' \
'GPRINT:out_avg:%6.1lf F\t' \
'GPRINT:out_min:%6.1lf F\t' \
'GPRINT:out_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside1#0000FF99:attic cntr\t' \
'GPRINT:in1_cur:%6.1lf F\t' \
'GPRINT:in1_avg:%6.1lf F\t' \
'GPRINT:in1_min:%6.1lf F\t' \
'GPRINT:in1_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside2#00CC0099:attic rear\t' \
'GPRINT:in2_cur:%6.1lf F\t' \
'GPRINT:in2_avg:%6.1lf F\t' \
'GPRINT:in2_min:%6.1lf F\t' \
'GPRINT:in2_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside3#CC000077:garage \t' \
'GPRINT:in3_cur:%6.1lf F\t' \
'GPRINT:in3_avg:%6.1lf F\t' \
'GPRINT:in3_min:%6.1lf F\t' \
'GPRINT:in3_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:nest1#00000066:nest   \t' \
'GPRINT:nest1_cur:%6.1lf F\t' \
'GPRINT:nest1_avg:%6.1lf F\t' \
'GPRINT:nest1_min:%6.1lf F\t' \
'GPRINT:nest1_max:%6.1lf F\l' \
"COMMENT: generated $(/bin/date "+%D %l:%M:%S %p" | sed 's/:/\\:/g')\r"


#
# 14 day (2 week) graph
#
rrdtool graph "$IMAGE_PATH/twoweek.png" \
--title 'temperature (14 day)' \
--vertical-label 'degrees (F)' \
--width '1200' \
--height '350' \
--full-size-mode \
--start end-2w \
--x-grid HOUR:12:DAY:1:DAY:1:86400:%a \
--y-grid 5:1 \
--right-axis 1:0 \
--slope-mode \
-P \
"DEF:outside=$RRD_PATH:outside:AVERAGE" \
"DEF:inside1=$RRD_PATH:inside1:AVERAGE" \
"DEF:inside2=$RRD_PATH:inside2:AVERAGE" \
"DEF:inside3=$RRD_PATH:inside3:AVERAGE" \
"DEF:nest1=$RRD_PATH:nest1:AVERAGE" \
'VDEF:out_avg=outside,AVERAGE' \
'VDEF:out_cur=outside,LAST' \
'VDEF:out_min=outside,MINIMUM' \
'VDEF:out_max=outside,MAXIMUM' \
'VDEF:in1_avg=inside1,AVERAGE' \
'VDEF:in1_cur=inside1,LAST' \
'VDEF:in1_min=inside1,MINIMUM' \
'VDEF:in1_max=inside1,MAXIMUM' \
'VDEF:in2_avg=inside2,AVERAGE' \
'VDEF:in2_cur=inside2,LAST' \
'VDEF:in2_min=inside2,MINIMUM' \
'VDEF:in2_max=inside2,MAXIMUM' \
'VDEF:in3_avg=inside3,AVERAGE' \
'VDEF:in3_cur=inside3,LAST' \
'VDEF:in3_min=inside3,MINIMUM' \
'VDEF:in3_max=inside3,MAXIMUM' \
'VDEF:nest1_avg=nest1,AVERAGE' \
'VDEF:nest1_cur=nest1,LAST' \
'VDEF:nest1_min=nest1,MINIMUM' \
'VDEF:nest1_max=nest1,MAXIMUM' \
'VRULE:in1_max#0000FF' \
'VRULE:in2_max#00CC00' \
'VRULE:in3_max#CC0000' \
COMMENT:"\t\t\t\t  <b>Current</b>\t\t    <b>Avg</b>\t\t   <b>Min</b>\t\t  <b>Max</b>\l" \
COMMENT:"\t" \
'AREA:outside#00FF0044:outside\t' \
'GPRINT:out_cur:%6.1lf F\t' \
'GPRINT:out_avg:%6.1lf F\t' \
'GPRINT:out_min:%6.1lf F\t' \
'GPRINT:out_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside1#0000FF99:attic cntr\t' \
'GPRINT:in1_cur:%6.1lf F\t' \
'GPRINT:in1_avg:%6.1lf F\t' \
'GPRINT:in1_min:%6.1lf F\t' \
'GPRINT:in1_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside2#00CC0099:attic rear\t' \
'GPRINT:in2_cur:%6.1lf F\t' \
'GPRINT:in2_avg:%6.1lf F\t' \
'GPRINT:in2_min:%6.1lf F\t' \
'GPRINT:in2_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside3#CC000077:garage \t' \
'GPRINT:in3_cur:%6.1lf F\t' \
'GPRINT:in3_avg:%6.1lf F\t' \
'GPRINT:in3_min:%6.1lf F\t' \
'GPRINT:in3_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:nest1#00000066:nest   \t' \
'GPRINT:nest1_cur:%6.1lf F\t' \
'GPRINT:nest1_avg:%6.1lf F\t' \
'GPRINT:nest1_min:%6.1lf F\t' \
'GPRINT:nest1_max:%6.1lf F\l' \
"COMMENT: generated $(/bin/date "+%D %l:%M:%S %p" | sed 's/:/\\:/g')\r"

#
# 1 month graph
#
rrdtool graph "$IMAGE_PATH/onemonth.png" \
--title 'temperature (1 month)' \
--vertical-label 'degrees (F)' \
--width '1200' \
--height '350' \
--full-size-mode \
--start end-1m \
--x-grid HOUR:12:DAY:1:DAY:1:86400:"%d" \
--y-grid 5:1 \
--right-axis 1:0 \
--slope-mode \
-P \
"DEF:outside=$RRD_PATH:outside:AVERAGE" \
"DEF:inside1=$RRD_PATH:inside1:AVERAGE" \
"DEF:inside2=$RRD_PATH:inside2:AVERAGE" \
"DEF:inside3=$RRD_PATH:inside3:AVERAGE" \
"DEF:nest1=$RRD_PATH:nest1:AVERAGE" \
'VDEF:out_avg=outside,AVERAGE' \
'VDEF:out_cur=outside,LAST' \
'VDEF:out_min=outside,MINIMUM' \
'VDEF:out_max=outside,MAXIMUM' \
'VDEF:in1_avg=inside1,AVERAGE' \
'VDEF:in1_cur=inside1,LAST' \
'VDEF:in1_min=inside1,MINIMUM' \
'VDEF:in1_max=inside1,MAXIMUM' \
'VDEF:in2_avg=inside2,AVERAGE' \
'VDEF:in2_cur=inside2,LAST' \
'VDEF:in2_min=inside2,MINIMUM' \
'VDEF:in2_max=inside2,MAXIMUM' \
'VDEF:in3_avg=inside3,AVERAGE' \
'VDEF:in3_cur=inside3,LAST' \
'VDEF:in3_min=inside3,MINIMUM' \
'VDEF:in3_max=inside3,MAXIMUM' \
'VDEF:nest1_avg=nest1,AVERAGE' \
'VDEF:nest1_cur=nest1,LAST' \
'VDEF:nest1_min=nest1,MINIMUM' \
'VDEF:nest1_max=nest1,MAXIMUM' \
'VRULE:in1_max#0000FF' \
'VRULE:in2_max#00CC00' \
'VRULE:in3_max#CC0000' \
COMMENT:"\t\t\t\t  <b>Current</b>\t\t    <b>Avg</b>\t\t   <b>Min</b>\t\t  <b>Max</b>\l" \
COMMENT:"\t" \
'AREA:outside#00FF0044:outside\t' \
'GPRINT:out_cur:%6.1lf F\t' \
'GPRINT:out_avg:%6.1lf F\t' \
'GPRINT:out_min:%6.1lf F\t' \
'GPRINT:out_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside1#0000FF99:attic cntr\t' \
'GPRINT:in1_cur:%6.1lf F\t' \
'GPRINT:in1_avg:%6.1lf F\t' \
'GPRINT:in1_min:%6.1lf F\t' \
'GPRINT:in1_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside2#00CC0099:attic rear\t' \
'GPRINT:in2_cur:%6.1lf F\t' \
'GPRINT:in2_avg:%6.1lf F\t' \
'GPRINT:in2_min:%6.1lf F\t' \
'GPRINT:in2_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside3#CC000077:garage \t' \
'GPRINT:in3_cur:%6.1lf F\t' \
'GPRINT:in3_avg:%6.1lf F\t' \
'GPRINT:in3_min:%6.1lf F\t' \
'GPRINT:in3_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:nest1#00000066:nest   \t' \
'GPRINT:nest1_cur:%6.1lf F\t' \
'GPRINT:nest1_avg:%6.1lf F\t' \
'GPRINT:nest1_min:%6.1lf F\t' \
'GPRINT:nest1_max:%6.1lf F\l' \
"COMMENT: generated $(/bin/date "+%D %l:%M:%S %p" | sed 's/:/\\:/g')\r"


#
# 3 month graph
#
rrdtool graph "$IMAGE_PATH/threemonth.png" \
--title 'temperature (3 month)' \
--vertical-label 'degrees (F)' \
--width '1200' \
--height '350' \
--full-size-mode \
--start end-3m \
--x-grid MONTH:1:WEEK:1:WEEK:1:0:"%b %d" \
--y-grid 5:1 \
--right-axis 1:0 \
--slope-mode \
-P \
"DEF:outside=$RRD_PATH:outside:AVERAGE" \
"DEF:inside1=$RRD_PATH:inside1:AVERAGE" \
"DEF:inside2=$RRD_PATH:inside2:AVERAGE" \
"DEF:inside3=$RRD_PATH:inside3:AVERAGE" \
"DEF:nest1=$RRD_PATH:nest1:AVERAGE" \
'VDEF:out_avg=outside,AVERAGE' \
'VDEF:out_cur=outside,LAST' \
'VDEF:out_min=outside,MINIMUM' \
'VDEF:out_max=outside,MAXIMUM' \
'VDEF:in1_avg=inside1,AVERAGE' \
'VDEF:in1_cur=inside1,LAST' \
'VDEF:in1_min=inside1,MINIMUM' \
'VDEF:in1_max=inside1,MAXIMUM' \
'VDEF:in2_avg=inside2,AVERAGE' \
'VDEF:in2_cur=inside2,LAST' \
'VDEF:in2_min=inside2,MINIMUM' \
'VDEF:in2_max=inside2,MAXIMUM' \
'VDEF:in3_avg=inside3,AVERAGE' \
'VDEF:in3_cur=inside3,LAST' \
'VDEF:in3_min=inside3,MINIMUM' \
'VDEF:in3_max=inside3,MAXIMUM' \
'VDEF:nest1_avg=nest1,AVERAGE' \
'VDEF:nest1_cur=nest1,LAST' \
'VDEF:nest1_min=nest1,MINIMUM' \
'VDEF:nest1_max=nest1,MAXIMUM' \
'VRULE:in1_max#0000FF' \
'VRULE:in2_max#00CC00' \
'VRULE:in3_max#CC0000' \
COMMENT:"\t\t\t\t  <b>Current</b>\t\t    <b>Avg</b>\t\t   <b>Min</b>\t\t  <b>Max</b>\l" \
COMMENT:"\t" \
'AREA:outside#00FF00:outside\t' \
'GPRINT:out_cur:%6.1lf F\t' \
'GPRINT:out_avg:%6.1lf F\t' \
'GPRINT:out_min:%6.1lf F\t' \
'GPRINT:out_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside1#0000FF99:attic cntr\t' \
'GPRINT:in1_cur:%6.1lf F\t' \
'GPRINT:in1_avg:%6.1lf F\t' \
'GPRINT:in1_min:%6.1lf F\t' \
'GPRINT:in1_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside2#00CC0099:attic rear\t' \
'GPRINT:in2_cur:%6.1lf F\t' \
'GPRINT:in2_avg:%6.1lf F\t' \
'GPRINT:in2_min:%6.1lf F\t' \
'GPRINT:in2_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside3#CC000077:garage \t' \
'GPRINT:in3_cur:%6.1lf F\t' \
'GPRINT:in3_avg:%6.1lf F\t' \
'GPRINT:in3_min:%6.1lf F\t' \
'GPRINT:in3_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:nest1#00000066:nest   \t' \
'GPRINT:nest1_cur:%6.1lf F\t' \
'GPRINT:nest1_avg:%6.1lf F\t' \
'GPRINT:nest1_min:%6.1lf F\t' \
'GPRINT:nest1_max:%6.1lf F\l' \
"COMMENT: generated $(/bin/date "+%D %l:%M:%S %p" | sed 's/:/\\:/g')\r"


#
# 5 month graph
#
rrdtool graph "$IMAGE_PATH/fivemonth.png" \
--title 'temperature (5 month)' \
--vertical-label 'degrees (F)' \
--width '1200' \
--height '350' \
--full-size-mode \
--start end-5m \
--x-grid MONTH:1:WEEK:1:WEEK:1:0:"%b %d" \
--y-grid 5:1 \
--right-axis 1:0 \
--slope-mode \
-u 120 -l 30 -r \
-P \
"DEF:outside=$RRD_PATH:outside:AVERAGE" \
"DEF:inside1=$RRD_PATH:inside1:AVERAGE" \
"DEF:inside2=$RRD_PATH:inside2:AVERAGE" \
"DEF:inside3=$RRD_PATH:inside3:AVERAGE" \
"DEF:nest1=$RRD_PATH:nest1:AVERAGE" \
'VDEF:out_avg=outside,AVERAGE' \
'VDEF:out_cur=outside,LAST' \
'VDEF:out_min=outside,MINIMUM' \
'VDEF:out_max=outside,MAXIMUM' \
'VDEF:in1_avg=inside1,AVERAGE' \
'VDEF:in1_cur=inside1,LAST' \
'VDEF:in1_min=inside1,MINIMUM' \
'VDEF:in1_max=inside1,MAXIMUM' \
'VDEF:in2_avg=inside2,AVERAGE' \
'VDEF:in2_cur=inside2,LAST' \
'VDEF:in2_min=inside2,MINIMUM' \
'VDEF:in2_max=inside2,MAXIMUM' \
'VDEF:in3_avg=inside3,AVERAGE' \
'VDEF:in3_cur=inside3,LAST' \
'VDEF:in3_min=inside3,MINIMUM' \
'VDEF:in3_max=inside3,MAXIMUM' \
'VDEF:nest1_avg=nest1,AVERAGE' \
'VDEF:nest1_cur=nest1,LAST' \
'VDEF:nest1_min=nest1,MINIMUM' \
'VDEF:nest1_max=nest1,MAXIMUM' \
'VRULE:in1_max#0000FF' \
'VRULE:in2_max#00CC00' \
'VRULE:in3_max#CC0000' \
COMMENT:"\t\t\t\t  <b>Current</b>\t\t    <b>Avg</b>\t\t   <b>Min</b>\t\t  <b>Max</b>\l" \
COMMENT:"\t" \
'AREA:outside#00FF00:outside\t' \
'GPRINT:out_cur:%6.1lf F\t' \
'GPRINT:out_avg:%6.1lf F\t' \
'GPRINT:out_min:%6.1lf F\t' \
'GPRINT:out_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside1#0000FF99:attic cntr\t' \
'GPRINT:in1_cur:%6.1lf F\t' \
'GPRINT:in1_avg:%6.1lf F\t' \
'GPRINT:in1_min:%6.1lf F\t' \
'GPRINT:in1_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside2#00CC0099:attic rear\t' \
'GPRINT:in2_cur:%6.1lf F\t' \
'GPRINT:in2_avg:%6.1lf F\t' \
'GPRINT:in2_min:%6.1lf F\t' \
'GPRINT:in2_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:inside3#CC000077:garage \t' \
'GPRINT:in3_cur:%6.1lf F\t' \
'GPRINT:in3_avg:%6.1lf F\t' \
'GPRINT:in3_min:%6.1lf F\t' \
'GPRINT:in3_max:%6.1lf F\l' \
COMMENT:"\t" \
'LINE2:nest1#00000066:nest   \t' \
'GPRINT:nest1_cur:%6.1lf F\t' \
'GPRINT:nest1_avg:%6.1lf F\t' \
'GPRINT:nest1_min:%6.1lf F\t' \
'GPRINT:nest1_max:%6.1lf F\l' \
"COMMENT: generated $(/bin/date "+%D %l:%M:%S %p" | sed 's/:/\\:/g')\r"
