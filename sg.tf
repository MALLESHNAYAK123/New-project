resource "aws_security_group" "my-security-group" {
  name        = "my-security-group"
  description = "my security group for inbond and outbond"
  vpc_id      = aws_vpc.vpc-1.id

  tags = {
    Name = "my-security-group"
  }
}

#ingress

resource "aws_vpc_security_group_ingress_rule" "port-22" {
  security_group_id = aws_security_group.my-security-group.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

#egress

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.my-security-group.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}