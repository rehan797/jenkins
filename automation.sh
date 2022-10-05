sudo su
sudo apt update -y
sudo apt install apache2 -y
systemctl start apache2
systemctl enable apache2

#Create a tar file
timestamp=$(date '+%d%m%Y-%H%M%S')
tar -cvf /tmp/"Rehan-httpd-logs-$timestamp.tar" /var/log/apache2

#Copy to S3
sudo apt install awscli -y
aws s3 cp /tmp/Rehan-httpd-logs-${timestamp}.tar  s3://upgrad-rehan
