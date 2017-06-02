# this file's filename is a reserved name, so that it's content is autoloaded.
# https://www.terraform.io/intro/getting-started/variables.html#from-a-file
# Here you can specify a bunch of key value pairs. This includes input variables (those defined in variables.tf)
# Note: any input variables defined here will override the default values (if any) defined in variable.tf

# You can think of these variable as terrafrom "environment" which get's "exported" as soon as you do a plan/apply

# you can call these variables in your other files, e.g. in main.tf using the syntax "${var.variable_name}"

puppet_enterprise_name = "puppetmaster"
env = "dev"
