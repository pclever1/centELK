ip=$(eval "ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'")
sed -i "s/#network.host: 192.168.0.1/network.host: $ip/g" /etc/elasticsearch/elasticsearch.yml
sed -i 's/#http.port: 9200/http.port: 9200/g' /etc/elasticsearch/elasticsearch.yml
echo '#discovery.seed_hosts: ["host1", "host2"]' | sed "s/#discovery.seed_hosts/discovery.seed_hosts/g"
echo '#discovery.seed_hosts: ["host1", "host2"]' | sed "s/host1/127.0.0.1/g"
echo '#discovery.seed_hosts: ["host1", "host2"]' | sed "s/host2/$ip/g"
