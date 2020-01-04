#check if root
if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit
fi

#install ELK
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
cd /etc/yum.repos.d/
sudo wget https://raw.githubusercontent.com/pclever1/centELK/master/elasticsearch.repo
yum -y install elasticsearch
yum -y install kibana
yum -y install logstash
