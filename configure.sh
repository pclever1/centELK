ip="1"
sed -i 's/#network.host: 192.168.0.1/network.host: '$ip'/g' /etc/elasticsearch/elasticsearch.yml
