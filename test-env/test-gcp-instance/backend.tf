terraform {
  backend "gcs" {
    bucket  = "tasdikrahman-test-env-terraform-state"
    path    = "tf/test-env/test-gcp-instance/terraform.tfstate"
    project = "tasdik-test-env"
  }
}
