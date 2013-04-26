#!/bin/sh

CONFIG_FILE=config.ini

while read line
do
#  echo ${line} | awk '!/^\[.*/ && !/^$/ { print $0 }'

  t=`echo ${line} | sed -n '/^[^\[]/p'`
  if [ ! -z $t ]; then
    #echo $t
    key=`echo $t | cut -d "=" -f1`
    value=`echo $t | cut -d "=" -f2`
    eval "${key}=${value}"
  fi
done < ${CONFIG_FILE}

echo $url
echo $port
echo $user
echo $password
echo $bbb
echo $ccc
