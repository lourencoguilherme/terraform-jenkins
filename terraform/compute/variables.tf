variable "aws_region" {
  type    = string
}

variable "vpc_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}

variable "vpc_name" {
  type    = string
}

variable "sub_net_name" {
  type    = string
  default = "labs-sub"
}

variable "sub_net_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "sub_net_availability_zone" {
  type    = string
}

variable "internet_gateway_name" {
  type    = string
  default = "labs-gw"
}

variable "route_table_name" {
  type    = string
  default = "labs-rt"
}

variable "key_pair_name" {
  type    = string
  default = "labs-key"
}

variable "instance_name" {
  type    = string
  default = "lab-ec2"
}

variable "instance_ami" {
  type    = string
  default = "ami-053b0d53c279acc90"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}
