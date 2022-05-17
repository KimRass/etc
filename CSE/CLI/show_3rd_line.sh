#!/bin/sh

for i in `find . -name "*.txt"`
do
    number=1
    while read line
    do
        if [ $number = 3 ]
        then
            echo $i $line
        fi
        number=$(( $number + 1 ))
    done < $i
done
