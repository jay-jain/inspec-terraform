# Inspec and Terraform
This repo provides basic examples for testing infrastructure deployed with Terraform with Chef InSpec
The terraform deploys an EC2 instance, Security Group, and an EIP attached to the instance (note: this costs money)


## Deploy Terraform code
```
cd tf/
terraform apply -auto-approve

# Write attributes.json file to profiles/twc directory
terraform output -json > ../profiles/twc/attributes.json
```

## Configure attributes.yml
```
cd profiles/twc/
yq eval -P attributes.json > attributes.yml
rm attributes.json
```


## Install yq
wget https://github.com/mikefarah/yq/releases/download/v4.5.1/yq_linux_amd64 -O /usr/bin/yq && chmod +x /usr/bin/yq


# Test IAM
`inspec exec profiles/twc/controls/iam.rb -t aws://us-east-1`

# Test SG
`inspec exec profiles/twc/controls/sg.rb -t aws://us-east-1 --input-file profiles/twc/attributes.yml`


### Configure Inspec directory
`inspec init profile profiles/twc`