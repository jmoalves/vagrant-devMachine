#!/bin/bash
logFile=/backup/logs/rsync-$( date +%Y%0m%0d-%H%M ).log
mkdir -p $( dirname $logFile )
echo > $logFile

echo | cat | tee -a  $logFile
echo ==================================================  | cat | tee -a  $logFile
echo === $( date '+%F %R' ) - BEGIN | cat | tee -a  $logFile
localDst=/backup/rsync
mkdir -p $localDst
rsync -avhW --no-compress /home/vagrant ${localDst} 2>&1 | cat | tee -a  $logFile;
echo === $( date '+%F %R' ) - END | cat | tee -a  $logFile
echo ==================================================  | cat | tee -a  $logFile
echo | cat | tee -a  $logFile

gzip -f $logFile

###
# Handle old logs
if [ -e $( dirname $logFile )/rsync-*.log ]; then
	for file in $( ls $( dirname $logFile )/rsync-*.log ); do
		gzip -f $file;
	done
fi

###
# Limit log files (50 max)
for file in $( ls $( dirname $logFile )/rsync-*.log.gz | sort -r | tail -n+51 ); do
	rm -v $file;
done

echo
echo === Log - $logFile

