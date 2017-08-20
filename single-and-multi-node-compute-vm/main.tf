resource "google_compute_instance" "instance" {
  name = "${var.instance-name}"

  ## for a setup having multiple instances of the same type, you can do
  ## the following, there would be 2 instances of the same configuration
  ## provisioned
  # count        = 2
  # name         = "${var.instance-name}-${count.index}"
  machine_type = "${var.vm_type["1point7gig"]}"

  zone = "${var.region}"

  tags = [
    "${var.network}-firewall-ssh",
    "${var.network}-firewall-http",
    "${var.network}-firewall-https",
    "${var.network}-firewall-icmp",
    "${var.network}-firewall-postgresql",
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
