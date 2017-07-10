#!/bin/bash

MYDIR=$HOME/shiny-dash-1/server-load/data
FILENAME=server-load.txt

LOAD=`uptime | sed 's/.*load_average: //' | awk -F\, '{print $1}'`
DATE=`date +%Y-%m-%d-%H:%M:%S`
echo "$DATE, $LOAD" >> $MYDIR/$FILENAME
