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

# Create a ec2 instance
# https://wiki.centos.org/Cloud/AWS
# the "centos.org" owner id is: '679593333241'
# aws ec2 describe-images --filters "Name=root-device-type,Values=ebs" "Name=name,Values=CentOS Linux 6 x86_64*" # This will least only amis available in the regions specified in the aws provider section
# aws ec2 describe-images --image-ids ami-051b1563
# monolithic install instance type recommendation (up to 4000 nodes):  c4.4xlarge (16 cores) but I recommend c4.8xlarge (36 cores) so you can run more jvm instances, handy for big mcollective runs
# https://docs.puppet.com/pe/latest/sys_req_hw.html#monolithic-installation-hardware-requirements

resource "aws_instance" "puppet_enterprise_ec2" {
  ami                    = "ami-051b1563"
  instance_type          = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.puppet_enterprise_sg.id}"] # https://www.terraform.io/docs/providers/aws/r/security_group.html#attributes-reference

  user_data = <<-EOF
               #!/bin/bash
               touch /tmp/testfile.txt
               EOF

  tags {
    Name = "${var.puppet_enterprise_name}"
    role = "Puppet_Enterprise"
  }
}

# creating a since aws_instance is bad practice. Instead it's
# better practive to make an autoscaling-group and launch-config
# resources which I have done further down. That will be covered in v2.0 of this repo.

