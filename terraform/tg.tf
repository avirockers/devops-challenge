resource "aws_lb_target_group" "nginxtg" {
  name                               = "nginxtg"
  port                               = 80 
  protocol                           = "HTTP"
  vpc_id                             = "vpc-87a63cec"
  target_type                        = "instance"
  proxy_protocol_v2                  = "false"
  health_check {
      enabled             = "true"
      port                = 80
      path                = "/version.txt"
      matcher             = 200
      interval            = 60
      protocol            = "HTTP"
  }
}

resource "aws_lb_target_group_attachment" "nginxtg-attachment" {
  target_group_arn = aws_lb_target_group.nginxtg.arn
  target_id        = aws_instance.nginxversion.id
  port             = 80
}
