variable "region" {
  default = "us-west1-a" # Oregon
}

variable "project-name" {
  default = "tasdik-test-env"
}

variable "subnetwork_region" {
  default = "us-west1"
}

variable "os" {
  default {
    "centos7"         = "centos-7-v20170816"
    "debian9"         = "debian-9-stretch-v20170816"
    "ubuntu-1604-lts" = "ubuntu-1604-xenial-v20170815a"
    "ubuntu-1704"     = "ubuntu-1704-zesty-v20170811"
  }
}

variable "vpc" {
  default = "test-vpc"
}
