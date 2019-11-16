echo "start"
read -p "What is your pfSense IP: " pfip
echo $pfip
echo "end"
pfip=`echo $pfip | sed 's/\./\\\\./g'`
echo $pfip | sed 's/172\\.22\\.33\\.1/$pfip/g'
