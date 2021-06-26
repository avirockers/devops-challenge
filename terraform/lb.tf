data "aws_subnet_ids" "subnet_ids" {
  vpc_id = "vpc-87a63cec"
}

resource "aws_lb" "nginx-lb" {
  name               = "nginx-lb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.nginxsgroup.id]
  subnets            = data.aws_subnet_ids.subnet_ids.ids

  enable_deletion_protection = true

  tags = {
    Application = "NGINX"
  }
}

