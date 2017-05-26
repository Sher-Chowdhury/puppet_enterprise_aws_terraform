
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
# monolithic install instance type recommendation (up to 4000 nodes):  c4.4xlarge (16 cores) but I recommend c4.8xlarge (36 cores) so you can run more jvm instances, handy for big mcollective runs
# https://docs.puppet.com/pe/latest/sys_req_hw.html#monolithic-installation-hardware-requirements
resource "aws_instance" "puppet_enterprise" {
   ami = "ami-051b1563"
   instance_type = "t2.micro"
}
