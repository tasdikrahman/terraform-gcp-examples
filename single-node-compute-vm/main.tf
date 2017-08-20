resource "google_compute_instance" "instance" {
  name         = "${var.instance-name}"
  machine_type = "${var.vm_type["1point7gig"]}"
  zone         = "${var.region}"

  tags = [
    "${var.network}-firewall-ssh",
    "${var.network}-firewall-http",
    "${var.network}-firewall-https",
    "${var.network}-firewall-icmp",
  ]

  disk {
    image = "${var.os["centos7"]}"
  }

  network_interface {
    subnetwork = "${google_compute_subnetwork.ovirt_network_subnetwork.name}"

    access_config {
      // Ephemeral IP
    }
  }
}
