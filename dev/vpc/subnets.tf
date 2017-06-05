
# aws ec2 describe-availability-zones
resource "aws_subnet" "az1" {
  vpc_id     = "${aws_vpc.tooling_vpc.id}"
  cidr_block = "10.0.1.0/24"
  availability_zone = eu-west-1a

  tags {
    Name = "Main"
  }
}
