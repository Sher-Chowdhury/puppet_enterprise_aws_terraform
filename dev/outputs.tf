# by conventions we create this file called 'outputs.tf' and it's main purpose is to define outputs:
# https://www.terraform.io/intro/getting-started/outputs.html
# when a new resources is created, it has attributes associated with it.
# for example when creating a new ec2 instance, aws will assign the new instance
# with things like an private ip adderess, public ip address, instance_id,...and etc:
# https://www.terraform.io/docs/providers/aws/r/instance.html#attributes-reference


#output "Puppet_Enterprise_Instance_ID" {
#  value = "${aws_instance.puppet_enterprise_ec2.id}"
#}

# it's best practice to output all available data. That's because you can
# call on them later on in your terraform code.
# once you have written your outputs, you simply do 'terrafrom apply' to view them, irrespective of whether
# those corresponding resources exists or not.
# Then you can these view values like this:
# terraform output Puppet_Enterprise_Instance_ID
# terraform show

