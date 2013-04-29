#!/bin/sh

while read line
do
  echo ${line} | sed -e "s/value=\"\(.*)\" size=30/\//g"
done < `/usr/bin/wget -q -O - "http://ddo.jp"`

