# Auto Scaling Group (asg) resources
resource "aws_autoscaling_group" "puppet_enterprise_asg" {
  name                 = "puppet_enterprise"
  launch_configuration = "${aws_launch_configuration.puppet_enterprise_lc.id}"
  min_size             = 1
  desired_capacity     = 1
  max_size             = 1
  availability_zones   = ["${data.aws_availability_zones.all-availibility-zones.names}"]

  tag {
    key                 = "Name"
    value               = "puppet_enterprise"
    propagate_at_launch = true
  }

  tag {
    key                 = "role"
    value               = "puppetmaster"
    propagate_at_launch = true
  }

  tag {
    key                 = "env"
    value               = "${var.env}"
    propagate_at_launch = true
  }
}
