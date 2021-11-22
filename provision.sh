#!/bin/bash

provDir=$( dirname "$0" )/provision

if [ ! -d $provDir ]; then
    echo Provision dir NOT FOUND - $provDir
    echo
    exit 1
fi

provUser=$1
if [ -z "$provUser" ]; then
    echo Inform the provisioning user
    echo
    exit 1
fi

begin=$( date "+%s" )
echo
echo PROVISION - BEG - $( date "+%Y%m%d-%H%M%S" )
echo ============================================================

mkdir -p ~/provision

for file in $provDir/*.sh; do
    doneFile=~/provision/$( basename $file ).done

    if [ ! -e $doneFile ]; then
        echo
        echo === BEG $file
        begFile=$( date "+%s" )
        if . $file $provUser; then
            touch $doneFile

            endFile=$( date "+%s" )
            echo === END $file - $( expr $endFile - $begFile ) s
            echo
        else
            echo
            echo === FAILED $file
            echo
            exit 1
        fi
    else
        echo === FOUND $doneFile
    fi
done

end=$( date "+%s" )
echo
echo ============================================================
echo PROVISION - END - $( date "+%Y%m%d-%H%M%S" ) - $( expr $end - $begin ) s
