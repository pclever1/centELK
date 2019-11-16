ip=$(eval "ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'")
echo $ip
sed -i "s/#discovery.seed_hosts: [\"host1\", \"host2\"]/#discovery.seed_hosts: [\"127.0.0.1\", \"$ip\"]/g" /etc/elasticsearch/elasticsearch.yml
