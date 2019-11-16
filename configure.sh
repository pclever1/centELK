ip=$(eval "ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'")
sed -i 's/#http.port: 9200/http.port: 9200/g' /etc/elasticsearch/elasticsearch.yml
sed -i 's/#network.host: 192.168.0.1/network.host: '$ip'/g' /etc/elasticsearch/elasticsearch.yml
