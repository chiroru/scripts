#!/bin/sh

#############################################################################
# Copyright (c) 2012 Shinichi hatano <smts1008@gmail.com> All right reserved.
#############################################################################
# Note. ファイル名でファイルを検索する。
#############################################################################

USAGE='usage:
    $ ffbn.sh ファイル名 ディレクトリ名';

if [ $# -ne 1  -a $# -ne 2 ];then
# if [ $# -ne 1] && [ $# -ne 2 ];then
    echo ${USAGE};
    exit 1;
fi

_keyword=$1;
_target=$2;

FIND_CMD="/usr/bin/find"

if [ -n "${_target}" ]; then
    ${FIND_CMD} "${_target}" -name "*${_keyword}*" -type f -ls;
else
    ${FIND_CMD} . -name "*${_keyword}*" -type f -ls;
fi
