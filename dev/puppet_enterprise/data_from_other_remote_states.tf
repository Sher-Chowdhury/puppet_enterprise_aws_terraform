# the following stores all the data that's stored in the vpc folder's outputs.tf file. and stores it
# as a attribute of an object which we have called 'tooling_vpc'
data "terraform_remote_state" "tooling_vpc" {
  backend = "s3"

  config {
    region = "eu-west-1"
    bucket = "codingbee101"
    key    = "puppet_enterprise_aws_terraform/dev/vpc/terraform.tfstate"
  }
}
