## 3.0.0 (2 June 2017)

Isolating State Files - it's best practice to have multiple state files that defines your infrastructure, rather than one. That's because if you have
a single statefile that defines dev/test/prod, then you have one of the following possible problems:

1. You make a change in dev that inadvertantly breaks prod
2. On rare occasions the state file can become corrupted, in which case the impact would effect your entire infrastructure. 

In this release we are going to split the statefile into environments. 
 


## 2.0.0 (May 28, 2017)

Achieves the same thing as version 1.0.0, but this time using launch configurations and auto-scaling groups. 

Achieves the same thing as version 1.0.0, but this time using launch configurations and auto-scaling groups. 

## 1.0.0 (May 28, 2017)

A hello world example of building a single ec2 instance. A security group was also created. 
