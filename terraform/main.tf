provider "aws" { 
  region = var.region 
} 
resource "aws_instance" "my-vm" { 
  count         = 2 
  ami           = lookup(var.ec2_ami, var.region) 
  instance_type = var.instance_type 
  tags = { 
    Name = "my-vm-${count.index + 1}" 
  } 
} 
resource "local_file" "tf_ip" { 
  content  = "[ALL]\n${aws_instance.my-vm[0].public_ip} ansible_ssh_user=ubuntu" 
  filename = "${path.module}/inventory" 
}
