read -p "What is your pfSense IP: " pfip
pfip=`echo $pfip | sed 's/\./\\\\./g'`
sed 's/172\\.22\\.33\\.1/$pfip/g'
