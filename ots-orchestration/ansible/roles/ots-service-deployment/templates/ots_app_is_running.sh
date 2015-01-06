#!/bin/bash -e

PWD="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
. $PWD/ots_app_lib.sh


pid=$(ots_pid)
$pid | while read line
do
    echo 'True'
    break
done
echo 'False'

