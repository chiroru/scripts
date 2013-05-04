#!/bin/sh

usage() {
  echo "第１引数にファイル名を指定する必要があります。";
  exit 1;
}

if [ -z $1 ]; then
  usage;
fi

if [ -f $1 ]; then
  while read source; do
    destination=`echo ${source} | sed 's/g^([ ]*)//g'`;
    echo ${destination};
  done < $1
else
  usage;
fi
