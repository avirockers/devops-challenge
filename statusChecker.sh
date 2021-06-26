#/bin/bash
lb_url="http://nginx-lb-1644501197.us-east-2.elb.amazonaws.com/version.txt"
if curl -s --head --request GET $lb_url | grep "200 OK" > /dev/null; then
if curl -s GET $lb_url | grep "1.0.6" > /dev/null; then
   echo "UP with Version 1.0.6"
else
echo "UP with a different Version"
fi
else
echo "DOWN"
ssh ec2-user@13.58.55.248 systemctl start nginx
ssh ec2-user@13.58.55.248 systemctl status nginx
fi
