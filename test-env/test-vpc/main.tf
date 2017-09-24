module "personal-vpc" {
  source = "github.com/tasdikrahman/terraform-gcp-network"
  name   = "${var.vpc_name}"
}

module "subnet-personal-vpc" {
  source            = "github.com/tasdikrahman/terraform-gcp-network-subnet"
  name              = "${var.subnet_name}"
  vpc               = "${module.personal-vpc.self_link}"
  subnetwork-region = "${var.subnetwork_region}"
  ip_cidr_range     = "${var.ip_cidr_range}"
}
