# These are information you need to provide in order for terraform plan+apply to work.
# https://www.terraform.io/docs/configuration/variables.html
# You can provide them in 4 differents way:
# - Using the 'default' attribute as shown in the ssh_key_path example below
# - Interactively, when doing apply/plan, you will get prompted, with the descriptions given below.
# - https://www.terraform.io/intro/getting-started/variables.html
# Note: 'terraform.tfvars' is an autoloade feature as described in the above link
variable "puppet_enterprise_name" {
  description = "What name do you want to assign the puppet ec2 instance"
  default     = "puppet_enterprise-default"
}
