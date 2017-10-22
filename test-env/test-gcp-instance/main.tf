resource "google_compute_instance" "test-instance" {
  name         = "test-instance"
  machine_type = "f1-micro"

  zone = "${var.region}"

  tags = [
    "${var.vpc}-firewall-ssh",
    "${var.vpc}-firewall-http",
    "${var.vpc}-firewall-https",
    "${var.vpc}-firewall-icmp",
  ]

  disk {
    image = "${var.os["ubuntu-1604-lts"]}"
  }

  network_interface {
    subnetwork = "${data.google_compute_subnetwork.test-vpc-subnet.name}"

    access_config {
      // Ephemeral IP
    }
  }

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}
