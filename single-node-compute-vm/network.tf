resource "google_compute_network" "ovirt_network" {
  name = "${var.network}"
}

resource "google_compute_subnetwork" "ovirt_network_subnetwork" {
  name          = "${var.network}-subnetwork-${var.subnetwork-region}"
  region        = "${var.subnetwork-region}"
  network       = "${google_compute_network.ovirt_network.self_link}"
  ip_cidr_range = "10.0.0.0/16"
}
