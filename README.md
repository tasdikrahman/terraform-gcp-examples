## terraform gcp examples

## Modules

- [GCS bucket](https://github.com/tasdikrahman/terraform-gcp-examples/tree/master/gcs-bucket/)
- [single-node-compute-vm](https://github.com/tasdikrahman/terraform-gcp-examples/tree/master/single-and-multi-node-compute-vm)
- [test-env](https://github.com/tasdikrahman/terraform-gcp-examples/tree/master/test-env/)

### Setup

Don't forget to place the file `account.json` inside the `credentials` dir in the root directory before running which would contain your service Account Key file.

This contains your authentication required for Terraform to talk to the Google API.

You can get it under 

`Google Cloud Platform -> API Manager -> Credentials -> Create Credentials -> Service account key.`

For the Key type field chose JSON. Put the downloaded file right were your Terraform config file is and name it `account.json`.

If you are using the gcs as the backend, you will need to give it the `Storage Admin` role for the `storage.buckets.create` permission.

## LICENSE

MIT Licensed
