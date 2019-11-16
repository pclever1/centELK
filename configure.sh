ip=$(eval "ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'")
sed -i "s/#network.host: 192.168.0.1/network.host: $ip/g" /etc/elasticsearch/elasticsearch.yml
sed -i 's/#http.port: 9200/http.port: 9200/g' /etc/elasticsearch/elasticsearch.yml
sed -i "s/#discovery.seed_hosts/discovery.seed_hosts/g" /etc/elasticsearch/elasticsearch.yml
sed -i "s/host1/127.0.0.1/g" /etc/elasticsearch/elasticsearch.yml
sed -i "s/host2/$ip/g" /etc/elasticsearch/elasticsearch.yml

sed -i "s/#server.port: 5601/server.port: 5601/g" /etc/kibana/kibana.yml
sed -i "s/#server.host/server.host/g" /etc/kibana/kibana.yml
sed -i "s/#elasticsearch.host/elasticsearch.host/g" /etc/kibana/kibana.yml
sed -i "s/localhost/$ip/g" /etc/kibana/kibana.yml
