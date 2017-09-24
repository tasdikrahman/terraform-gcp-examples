module "firewall-ssh" {
  source        = "github.com/tasdikrahman/terraform-gcp-network-firewall"
  name          = "ssh"
  network       = "${data.google_compute_network.test-vpc.name}"
  protocol      = "tcp"
  ports         = ["22"]
  source_ranges = ["0.0.0.0/0"]
}

module "firewall-http" {
  source        = "github.com/tasdikrahman/terraform-gcp-network-firewall"
  name          = "http"
  network       = "${data.google_compute_network.test-vpc.name}"
  protocol      = "tcp"
  ports         = ["80"]
  source_ranges = ["0.0.0.0/0"]
}

module "firewall-https" {
  source        = "github.com/tasdikrahman/terraform-gcp-network-firewall"
  name          = "https"
  network       = "${data.google_compute_network.test-vpc.name}"
  protocol      = "tcp"
  ports         = ["443"]
  source_ranges = ["0.0.0.0/0"]
}

resource "google_compute_firewall" "icmp" {
  name    = "${var.vpc}-firewall-icmp"
  network = "${data.google_compute_network.test-vpc.name}"

  allow {
    protocol = "icmp"
  }

  target_tags   = ["${var.vpc}-firewall-icmp"]
  source_ranges = ["0.0.0.0/0"]
}
