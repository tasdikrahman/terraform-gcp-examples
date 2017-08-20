resource "google_storage_bucket" "tasdikrahman-terraform-state" {
  name          = "tasdikrahman-terraform-state"
  location      = "${var.location}"
  force_destroy = true
}
