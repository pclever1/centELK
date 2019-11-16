if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi
myip=$(eval "ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'")
echo $myip


x="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
eval "$x"
y=$(eval "$x")
echo "$y"
