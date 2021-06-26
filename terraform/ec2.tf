resource "aws_instance" "nginxversion" {
  ami           = "ami-09246ddb00c7c4fef"
  key_name = "avinash"
  instance_type = "t2.micro"
  security_groups = ["nginxsgroup"]
  user_data = <<-EOF
  #!/bin/bash
  sudo yum update -y
  sudo amazon-linux-extras install nginx1.12 -y
  sudo systemctl start nginx
  sudo systemctl enable nginx
  echo "1.0.6" | sudo tee /usr/share/nginx/html/version.txt
  EOF

  lifecycle {
  create_before_destroy = true
  }
  tags= {
    Name = "NGINX-SERVER"
  }
}

