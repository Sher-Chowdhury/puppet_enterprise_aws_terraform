# This file defines all the resources that needs to be created, along with which cloud provider to use.

# aws ec2 describe-regions
# http://docs.aws.amazon.com/general/latest/gr/rande.html
provider "aws" {
  region = "eu-west-1"
}

resource "aws_security_group" "puppet_enterprise_sg" {
  name        = "puppet_enterprise_sg"
  description = "create ingress rules for ssh, puppet agent, mcollective, and puppet web console"

  # ssh
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # puppet agent runs
  ingress {
    from_port   = 8140
    to_port     = 8140
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # mcollective
  ingress {
    from_port   = 61613
    to_port     = 61613
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # puppet enterprise web console - https
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_configuration" "puppet_enterprise_lc" {
  name            = "puppet_enterprise"
  image_id        = "ami-051b1563"
  instance_type   = "t2.micro"
  security_groups = ["${aws_security_group.puppet_enterprise_sg.id}"] # https://www.terraform.io/docs/providers/aws/r/security_group.html#attributes-reference

  lifecycle {
    create_before_destroy = true
  }
}

# Note for availability_zones, we could just list out all the availability zones that are in a region,
# however a better approach is to ask aws to provide this information. These are known as datasources:
# https://www.terraform.io/docs/configuration/data-sources.html
# In our case, we will use the following datasource:
# https://www.terraform.io/docs/providers/aws/d/availability_zones.html#
data "aws_availability_zones" "all-availibility-zones" {}

# you can think of datasources as a bit like puppet's 'facter'
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
