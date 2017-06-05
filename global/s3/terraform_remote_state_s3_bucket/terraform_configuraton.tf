# This is used to configure terraform itself. 
# https://www.terraform.io/docs/configuration/terraform.html#description

terraform {
  backend "s3" {
    bucket = "codingbee101"
    key    = "/terraform-remote-backend/terraform.tfstate"
    region = "eu-west-1"
  }
}
