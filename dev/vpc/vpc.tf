# this is the tooling vpc
resource "aws_vpc" "tooling_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags {
    Name = "tooling_vpc"
  }
}
