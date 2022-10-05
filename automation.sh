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

#Bookkeeping
if [ ! -f /var/www/html/inventory.html ]
then
        echo -e "Log Type\tTime Created\tType\tSize" >/var/www/html/inventory.html
        echo -e "httpd-logs\t$timestamp\ttar\t`du -sh /var/www/html/inventory.html | awk '{print $1}'` " >> /var/www/html/inventory.html
else
        echo -e "httpd-logs\t$timestamp\ttar\t`du -sh /var/www/html/inventory.html | awk '{print $1}'` " >> /var/www/html/inventory.html
fi

#Cronjob

echo " * * * * * root /root/Automation_Project/automation.sh" > automation.txt
crontab automation.txt

