## Pre-req

1. set up an aws account
2. set up a non root aws account (via iam), assign non-root account full admin priveleges
3. create api based aws access keys 
4. add and export these keys in local machine's ~/.profile, then do 'source ~/.profile' or restart terminal:
```
# export AWS_ACCESS_KEY_ID=xxxxxxxxxxxxx
# export AWS_SECRET_ACCESS_KEY=xxxxxxxxxxxxxxxxxxxxxxx
```
5. manually create an s3 bucket that will store your terraform statefiles.
6. for a given folder, always run 'terraform init' on the first occasion. This is so to downlaod any modules and sets up terraform configurations (via terraform_conf.tf file)
7. you can then run terraforom plan/apply/destroy
