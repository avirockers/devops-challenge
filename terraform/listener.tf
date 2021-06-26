resource "aws_lb_listener" "nginx-listener" {
  load_balancer_arn = aws_lb.nginx-lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginxtg.arn
  }
}

resource "aws_alb_listener_rule" "alb_rules" {
  listener_arn = aws_lb_listener.nginx-listener.arn

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.nginxtg.arn
 }
 condition {
    path_pattern {
      values = ["/version.txt"]
    }
  } 
 depends_on = [
    aws_lb.nginx-lb,
  ]
 }
