# Create EC2 Instance - Amazon2 Linux

resource "aws_instance" "project9_ec2" {
  ami           = var.aws_ami
  instance_type = "t2.micro"

  ##user_data = file("apache-install.sh")  
  # user_data =  templatefile("user_data.tmpl", {package_name = var.package_name})
  vpc_security_group_ids = [aws_security_group.project9_SG.id]
  subnet_id = aws_subnet.proj9_pub_sub2.id
  
  tags = {
    "Name" = "project9_ec2"
  }
}