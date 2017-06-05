# This is used to configure terraform itself. 
# https://www.terraform.io/docs/configuration/terraform.html#description

# the fact that this file exists, means that you can't just do 'terraform plan' anymore. you have to first do 'terraform init'. 
# this will end up creating the .terraform directory. 

terraform {
  backend "s3" {
    bucket = "codingbee101"
    key    = "puppet_enterprise_aws_terraform/dev/vpc/terraform.tfstate"
    region = "eu-west-1"
  }
}
