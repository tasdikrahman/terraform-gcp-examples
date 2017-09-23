variable "vpc_name" {
  default = "test-vpc"
}

variable "subnet_name" {
  default = "test-vpc-subnet"
}

variable "ip_cidr_range" {
  default = "10.0.0.0/8"
}

variable "subnetwork_region" {
  default = "us-west1"
}

variable "region" {
  default = "us-west1-a" # Oregon
}

variable "project-name" {
  default = "tasdik-test-env"
}
