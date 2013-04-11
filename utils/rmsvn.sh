#!/bin/sh

FIND_CMD=/usr/bin/find
XARGS_CMD=/usr/bin/xargs

Usage="rmsvn.sh [directory]
"

if [ $# -ne 1 ];then
    echo ${Usage};
	exit 1;
fi

${FIND_CMD} $1 -mindepth 1 -type d -name .svn
