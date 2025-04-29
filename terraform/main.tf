resource "aws_instance" "my-vm" {
  ami           = "ami-0df0e7600ad0913a9"
  instance_type = "t2.micro"

  tags = {
    Name = "Vitaliy"
  }
}
