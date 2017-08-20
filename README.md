## terraform gcp examples

## Modules

- [GCS bucket](https://github.com/tasdikrahman/terraform-gcp-examples/tree/master/gcs-bucket/README.md)
- [single-node-compute-vm](https://github.com/tasdikrahman/terraform-gcp-examples/tree/master/single-node-compute-vm/README.md)

### Setup

Don't forget to place the file `account.json` inside the `credentials` dir in the root directory before running which would contain your service Account Key file.

This contains your authentication required for Terraform to talk to the Google API.

You can get it under 

`Google Cloud Platform -> API Manager -> Credentials -> Create Credentials -> Service account key.`

For the Key type field chose JSON. Put the downloaded file right were your Terraform config file is and name it `account.json`.

## LICENSE

MIT Licensed