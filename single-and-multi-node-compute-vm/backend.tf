terraform {
  backend "gcs" {
    bucket  = "tasdikrahman-terraform-state"
    path    = "gcp/terraform.tfstate"
    project = "gsoc-172407"
  }
}
