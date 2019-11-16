echo "What is your pfSense IP?"
read pfip
pfip=`echo $pfip | sed 's/\./\\\\./g'`
sed 's/172\\.22\\.33\\.1/$pfip/g'
