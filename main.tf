
# aws ec2 describe-regions
# http://docs.aws.amazon.com/general/latest/gr/rande.html
provider "aws" {
  region     = "eu-west-1"
}

# Create a ec2 instance
# https://wiki.centos.org/Cloud/AWS
# the "centos.org" owner id is: '679593333241'
# aws ec2 describe-images --filters "Name=root-device-type,Values=ebs" "Name=name,Values=CentOS Linux 6 x86_64*"
# aws ec2 describe-images --image-ids ami-051b1563
resource "aws_instance" "puppet_enterprise" {
   ami = "ami-051b1563"
   instance_type = "t2.micro"
}
