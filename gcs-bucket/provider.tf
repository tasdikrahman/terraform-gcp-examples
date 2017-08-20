provider "google" {
  credentials = "${file("${path.module}/../credentials/account.json")}"
  project     = "${var.project-name}"
  region      = "${var.region}"
}
