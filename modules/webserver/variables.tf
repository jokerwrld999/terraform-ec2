variable "env_prefix" {
  description = "Environment Prefix"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "web_subnet_id" {
  description = "Web Subnet ID"
  type        = string
}

variable "sg_ports" {
  description = "Security Group Ports"
  type        = map(any)
}

variable "ssh_key_name" {
  description = "SSH Key Name"
  type        = string
}
