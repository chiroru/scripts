#!/bin/sh

# commnad definitions.
FIND_CMD="/usr/bin/find"
DU_CMD="/usr/bin/du"
XARGS_CMD="/usr/bin/xargs"

if [ $# -ne 1 ]
then
    echo "error!";
    exit 1;
fi

${FIND_CMD} ${1} -mindepth 1 -maxdepth 1 -type d | ${XARGS_CMD} ${DU_CMD} -sk |\
awk '{print $0}'
