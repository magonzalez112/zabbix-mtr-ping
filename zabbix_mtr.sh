#!/bin/bash
wrst=$(mtr -r $* | grep -v HOST | tail -n 1 | awk '{ print ($8) }')
#wrst=${wrst:-"-1.0"} This does literally nothing in Kali Linux 21
echo $wrst
