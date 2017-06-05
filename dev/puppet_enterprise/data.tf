# data from aws (a bit like how puppet's facter)
# https://www.terraform.io/docs/configuration/data-sources.html

# https://www.terraform.io/docs/providers/aws/d/availability_zones.html
data "aws_availability_zones" "all-availibility-zones" {}
