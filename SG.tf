# Create Security Group - SSH and Web Traffic

resource "aws_security_group" "project9_SG" {
  name        = "project9_SG"
  description = "Enable SSH and Web Traffic on ports 22 and 80 respectively"
  vpc_id      = aws_vpc.project9_vpc.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]

  }

  tags = {
    Name = "project9_SG"
  }
}
