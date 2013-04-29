#!/bin/sh

while [ 0 -ne $# ]
do
  echo $1"/"$#
  shift 2
done
