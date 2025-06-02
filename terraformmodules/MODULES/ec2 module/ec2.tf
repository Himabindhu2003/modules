resource "aws_instance" "ubuntu_instance" {
    instance_type = var.instance-type
    ami = var.ami-id
    key_name = var.key-name
    associate_public_ip_address = true
    subnet_id = var.sub-id
    
  
}