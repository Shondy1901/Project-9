# Autoscaling Launch Configuration

resource "aws_launch_configuration" "project9_asc" {
  name_prefix   = "project9_asc"
  image_id      = var.aws_ami
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}