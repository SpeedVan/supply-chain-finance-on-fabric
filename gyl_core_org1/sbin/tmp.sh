#!/bin/bash
parr=""
if [ $# -ge 1 ]; then
    parr='"'$1'"'
    for i in ${@:2}
    do
        parr=${parr}',"'${i}'"'
    done
fi
echo ${parr}
# str="$@"
# echo ${str}
# echo "${str// /,}"