#!/bin/bash

while true
do
  eval $1 &
  echo $! > ~/alive_pid
  i=0
  while test $i -lt 3600 -a -e /proc/`cat ~/alive_pid`
  do
    sleep 1
    i=$(($i+1))
  done
  kill `cat ~/alive_pid`
  kill `pidof sox`
done

