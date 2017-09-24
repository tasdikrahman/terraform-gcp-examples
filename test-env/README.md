## test-env

This environment contains a separate VPC created from `test-vpc` with some default firewall rules. A test-instance as a personal test environment.

## Order of execution

```
$ terraform plan
$ terraform apply
```

inside 

1. `test-vpc`

2. `test-gcp-instance`
