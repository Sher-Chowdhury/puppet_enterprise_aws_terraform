# Launch Configuration (lc) resources

resource "aws_launch_configuration" "puppet_enterprise_lc" {
  name            = "puppet_enterprise"
  image_id        = "ami-051b1563"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.puppet_enterprise_sg.id}"] # https://www.terraform.io/docs/providers/aws/r/security_group.html#attributes-reference

  lifecycle {
    create_before_destroy = true
  }
}
