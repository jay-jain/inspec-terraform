
#### EIP Attributes
output "private_ip" {
  value = aws_eip.ip.private_ip
}

output "public_ip" {
  value = aws_eip.ip.public_ip
}

output "eip_instance" {
    value = aws_eip.ip.instance
}

### EC2 Instance Attributes
output "volume_id" {
  value = aws_instance.webserver.root_block_device.0.volume_id
}

output "root_is_encrypted" {
  value = aws_instance.webserver.root_block_device.0.encrypted
}

output "root_volume_size" {
  value = aws_instance.webserver.root_block_device.0.volume_size
}

output "root_volume_type" {
  value = aws_instance.webserver.root_block_device.0.volume_type
}

output "ami_id" {
  value = aws_instance.webserver.ami
}

output "associate_public_ip" {
  value = aws_instance.webserver.associate_public_ip_address
}

output "instance_profile" {
  value = aws_instance.webserver.iam_instance_profile
}

output "instance_type" {
  value = aws_instance.webserver.instance_type
}

output "key_name" {
  value = aws_instance.webserver.key_name
}

output "security_groups" {
  value = aws_instance.webserver.vpc_security_group_ids
}

output "source_destination_check" {
  value = aws_instance.webserver.source_dest_check
}

output "subnet_id" {
  value = aws_instance.webserver.subnet_id
}

output "tags" {
  value = aws_instance.webserver.tags
}

### Security Group Attributes

output "security_group_name" {
    value = aws_security_group.WebServerSG.name
}

output "security_group_ingress" {
    value = aws_security_group.WebServerSG.ingress
}

output "security_group_vpc_id" {
    value = aws_security_group.WebServerSG.vpc_id
}

output "security_group_tags"{
    value = aws_security_group.WebServerSG.tags
}

output "security_group_id" {
    value = aws_security_group.WebServerSG.id
}