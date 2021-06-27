Infrastructure Coding Test
==========================

**Creation of Web Server:**
Spin up EC2 instance using terraform scripts provided in the repository by following below commands
      1) terraform init //to Initialize a terraform workspace with needed providers
      2) terraform validate // to validate the configuration changes
      3) terraform plan // to get the detailed description of what changes will be made once changes are executed.
      4) terraform apply --auto-approve // to apply the configuration changes provided in the terraform scripts.
      
 Once the scripts are executed it will create ec2 instance with needed configurations and install nginx in it and also create a version.txt file and it can be accessed with the help of below url.
 
      http://ipaddress/version.txt
 
 Alternatively we can create this manually by following below steps:
 
       1) Spin up ec2 instance(Amazon linux2 AMI)
       2) ssh into the newly created ec2 instance.
       3) execute the command sudo yum update -y // to update repositories in the server
       4) sudo amazon-linux-extras install nginx1.12 -y // to install nginx server
       5) sudo systemctl start nginx // to start nginx service
       6) sudo systemctl status nginx // to check the status of nginx service
       7) echo "1.0.6" | sudo tee /usr/share/nginx/html/version.txt // to add a version number in the version.txt
 
 **Checking Server Status:**
     
     Inorder to check whether the server is up and running or not we can use _statusChecker.sh_ file which will check if the particular endpoint is up and running or not.
     
     If it is up it will check the version is correct or not. If it is down it will start the service by ssh into the instance. (Make sure passwordless ssh connection is set between external machine and current ec2 machine where nginx is running)
     
     We can make it run periodically by setting up crontab in the external system. 
               use **crontab -e** to create a new crontab and add below entry  
               */5 * * * * sh statusChecker.sh  //this will check the status every 5 minutes
 
 
 **Extra Credits:**
 
        1) Terraform is used to provision entire instrastructure
        2) Load balancer is created using terraform and target groups are created and attached using terraform
              LB URL -> http://nginx-lb-1644501197.us-east-2.elb.amazonaws.com/version.txt
        3) Created Docker File with nginx image that serves version.txt file which is available under docker folder.
        4) StatusChecker script checks server status if it is down. It will start the nginx service by ssh into the instance.
 
