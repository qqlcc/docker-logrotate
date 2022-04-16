#!/bin/sh

scripts=$(ls /usr/local/scripts)
for script in $scripts
do
    source /usr/local/scripts/$script
done

exec $@