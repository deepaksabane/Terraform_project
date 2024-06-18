resource "aws_alb" "myloadbalancer" {
    name = "myloadbalancerappy"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.allow_tls.id]
    subnets = [aws_subnet.public_subnet-2a.id, aws_subnet.public_subnet-2b.id]
    enable_deletion_protection = false
    tags = {
        Name = "myappy"
    }
}

resource "aws_alb_target_group" "app_tg" {
    name = "mytg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.main.id
    
    health_check {
        path = "/"
        port = "traffic-port"
        interval = 30
        timeout = 5
        healthy_threshold = 5
        unhealthy_threshold = 2
        matcher = "200"

    }
}

resource "aws_lb_target_group_attachment" "attach1" {
    target_group_arn = aws_alb_target_group.app_tg.arn
    target_id = aws_instance.deepu_instance.id
    port = 80
}

resource "aws_lb_target_group_attachment" "attach2" {
    target_group_arn = aws_alb_target_group.app_tg.arn
    target_id = aws_instance.shivansh_instance.id
    port = 80
}

resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_alb.myloadbalancer.arn
    port = 80
    protocol = "HTTP"

    default_action {
        type = "forward"
        target_group_arn = aws_alb_target_group.app_tg.arn
    }
}

output "loadbalancer_dns" {
    value = aws_alb.myloadbalancer.dns_name
}
