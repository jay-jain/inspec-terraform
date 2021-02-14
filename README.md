
cd tf/
terraform apply -auto-approve
terraform output -json > attributes.json

cd ..
inspec init profile profile


wget https://github.com/mikefarah/yq/releases/download/${VERSION}/${BINARY} -O /usr/bin/yq && chmod +x /usr/bin/yq
yq eval -P attributes.json > attributes.yml
mv tf/attributes.yml profile/attributes.yml


# Test IAM
cd profile/controls/
inspec exec iam.rb -t aws://

# Test SG
inspec exec profiles/twc/controls/ -t aws://us-east-1 --input-file profiles/twc/attributes.yml