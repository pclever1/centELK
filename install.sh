yum -y install java
yum -y install wget
rpm --import https://artifacts.elastic.co/GPG-KEY-elasticsearch
cd /etc/yum.repos.d/
sudo wget https://raw.githubusercontent.com/pclever1/centELK/master/elasticsearch.repo
yum -y install elasticsearch
yum -y install kibana
yum -y install logstash
cd /etc/logstash/conf.d
sudo wget https://raw.githubusercontent.com/a3ilson/pfelk/master/conf.d/01-inputs.conf
sudo wget https://raw.githubusercontent.com/a3ilson/pfelk/master/conf.d/05-syslog.conf
sudo wget https://raw.githubusercontent.com/a3ilson/pfelk/master/conf.d/10-pf.conf
sudo wget https://raw.githubusercontent.com/a3ilson/pfelk/master/conf.d/11-firewall.conf
sudo wget https://raw.githubusercontent.com/a3ilson/pfelk/master/conf.d/50-outputs.conf
sudo wget https://raw.githubusercontent.com/a3ilson/pfelk/master/conf.d/12-suricata.conf
sudo wget https://raw.githubusercontent.com/a3ilson/pfelk/master/conf.d/13-snort.conf
sudo wget https://raw.githubusercontent.com/a3ilson/pfelk/master/conf.d/15-others.conf
mkdir /etc/logstash/conf.d/patterns
/bin/systemctl daemon-reload
/bin/systemctl enable elasticsearch.service
/bin/systemctl enable kibana.service
/bin/systemctl enable logstash.service
systemctl stop firewalld
