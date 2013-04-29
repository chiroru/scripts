#!/bin/sh

declare -A array

cnt=0
while read line
do
#  target=`echo ${line} | sed -n '/!(^\[.*\]$)/p'`
  target=`echo ${line} | sed -n '/^[^\[].*$/p' | tr -d "\r"`
  if [ ! -z ${target} ]; then
    echo ">"${#target}"<"
    echo `echo ${target} | cut -f2 -d "="`
    array[${cnt}]=${target}
    cnt=`expr ${cnt} + 1`
  fi 
done < config.ini

i=0
while [ $i -lt ${cnt} ]
do
  echo $i":"${array[$i]}
  i=`expr $i + 1`
done
