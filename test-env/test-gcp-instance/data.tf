data "google_compute_subnetwork" "test-vpc-subnet" {
  name   = "${var.vpc}-subnet"
  region = "${var.subnetwork_region}"
}

data "google_compute_network" "test-vpc" {
  name = "${var.vpc}"
}
