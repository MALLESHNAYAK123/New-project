#instance

resource "aws_instance" "my-instance" {
  ami             = "ami-084568db4383264d4"
  instance_type   = "t2.micro"
  key_name        = "mallesh"
  subnet_id       = aws_subnet.public-subnet-2.id
  security_groups = [aws_security_group.my-security-group.id]
  root_block_device {
    volume_size = "10"
  }
}