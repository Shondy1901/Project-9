
# VPC Variable

variable "vpc_cidr" {
  description = "VPC CIDR"
  type        = string
  default     = "10.0.0.0/16"
}

# Private Subnet Variable

variable "pri_cidr" {
  description = "Private Subnet 1"
  type        = string
  default     = "10.0.0.0/24"
}

# Private Subnet Variable

variable "pri_cidr_2" {
  description = "Private Subnet 2"
  type        = string
  default     = "10.0.1.0/24"
}


# Public Subnet Variable

variable "pub_cidr" {
  description = "Public Subnet 1"
  type        = string
  default     = "10.0.2.0/24"
}

# Public Subnet Variable

variable "pub_cidr_2" {
  description = "Public Subnet 2"
  type        = string
  default     = "10.0.3.0/24"
}

# Region Variable

variable "aws_region" {
  description = "Region"
  type        = string
  default     = "eu-west-1"
}

# AMI Variable

variable "aws_ami" {
  type = string
  description = "AMI"
  default = "ami-01efa4023f0f3a042"
}
