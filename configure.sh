
#check local IP
ip=$(eval "ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'")

#configure elasticsearch
sed -i "s/#network.host: 192.168.0.1/network.host: $ip/g" /etc/elasticsearch/elasticsearch.yml
sed -i 's/#http.port: 9200/http.port: 9200/g' /etc/elasticsearch/elasticsearch.yml
sed -i "s/#discovery.seed_hosts/discovery.seed_hosts/g" /etc/elasticsearch/elasticsearch.yml
sed -i "s/host1/127.0.0.1/g" /etc/elasticsearch/elasticsearch.yml
sed -i "s/host2/$ip/g" /etc/elasticsearch/elasticsearch.yml

#configure kibana
sed -i "s/#elasticsearch.host/elasticsearch.host/g" /etc/kibana/kibana.yml


#configure logstash
sed -i "s/localhost/$ip/g" /etc/logstash/conf.d/50-outputs.conf




#start services
systemctl restart elasticsearch 
systemctl restart kibana 
systemctl restart logstash 

clear
echo
echo '-------------------------'
echo "Install has completed."
echo "You must configure pfSense to forward logs to $ip:5140"
echo "ELK is now running, you can access it at $ip:5601"
echo '-------------------------'
