#!/bin/bash

pull() {
        pwd;
        git pull;
}

run() {
        cd $1;
        
        for x in $(ls .)
        do
                if [ -d "$x" ]; then
                    cd $x
                    pull;
                    cd ..
                fi
        done
}

p=.
if [ $1 ];then
    p=$1
fi
echo $p

run $p