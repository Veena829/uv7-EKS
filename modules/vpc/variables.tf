variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
}

variable "public_subnet_1_cidr" {
  description = "The CIDR block for the first public subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "public_subnet_2_cidr" {
  description = "The CIDR block for the second public subnet"
  type        = string
  default     = "10.0.2.0/24"
}

variable "private_subnet_1_cidr" {
  description = "The CIDR block for the first private subnet"
  type        = string
  default     = "10.0.3.0/24"
}

variable "private_subnet_2_cidr" {
  description = "The CIDR block for the second private subnet"
  type        = string
  default     = "10.0.4.0/24"
}

variable "az_1" {
  description = "The availability zone for the first subnet"
  type        = string
  default     = "us-west-1a"
}

variable "az_2" {
  description = "The availability zone for the second subnet"
  type        = string
  default     = "us-west-1b"
}

