### Environment Setup
- Download CentOS Minimal (I used centos7-x86_64-minimal-1810.iso)
- Create VM with minimum 2gb Ram 1 CPU
- Give the VM enough storage to handle the data you want to send + 3.5gbs for instillation. (I experience about 150mb of data per day)
- I strongly recommend setting up a private IP in either DCHP or on the CentOS VM itself


### Login to pfSense and Forward syslogs
- In pfSense navigate to Status->System Logs, then click on Settings.
- At the bottom check "Enable Remote Logging"
- (Optional) Select a specific interface to use for forwarding
- Enter the ELK local IP into the field "Remote log servers" with port 5140
- Under "Remote Syslog Contents" check "Everything"
- Click Save


### Run the following:

```
sudo su -
yum install wget
wget -O - https://raw.githubusercontent.com/pclever1/centELK/master/install.sh | bash <(cat) </dev/tty
```

### 23. Set-up Kibana
- In your web browser go to the ELK local IP using port 5601
- Click the gear icon in the bottom left
- Click Kibana -> Index Patters
- Click Create New Index Pattern
- Type "pf*" into the input box, then click Next Step
- In the Time Filter drop down select "@timestamp"
- Click Create then verify you have data showing up under the Discover tab


### Troubleshooting
- Restart services:
```
systemctl stop elasticsearch 
systemctl stop kibana 
systemctl stop logstash 
systemctl start elasticsearch 
systemctl start kibana 
systemctl start logstash 
```

- Check logs for errors:
```
sudo vi /var/log/logstash/logstash-plain.log
sudo vi /var/log/elasticsearch/elasticsearch.log
(Press Shift + G to scroll to bottom, Escape then type ":q!" to exit)
```
