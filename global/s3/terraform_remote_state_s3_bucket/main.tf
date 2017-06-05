# This file defines all the resources that needs to be created, along with which cloud provider to use.

# aws ec2 describe-regions
# http://docs.aws.amazon.com/general/latest/gr/rande.html
provider "aws" {
  region = "eu-west-1"
}
