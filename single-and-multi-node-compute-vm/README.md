## Single node VM

This demonstrates the provisioning of a single compute VM(`g1-small`) with centos7 (these can be changed inside the `variables.tf` file) in GCP inside a custom created VPC with firewall rules attached to it.

You can use the remote backend as `gcs` or any other backends as described in the docs of terraform. If using `gcs` as is the case here. Do a

```bash
$ gcloud auth application-default login
```

before running 

```bash
$ terraform init
```

This will create the `terraform.tfstate` file in the bucket as specified in `backend.tf`

**NOTE**

You can create multiple instances of the same type by modifying you `main.tf` like

```hcl
...
...
name = "${var.instance-name}"

## for a setup having multiple instances of the same type, you can do
## the following, there would be 2 instances of the same configuration
## provisioned
# count        = 2
# name         = "${var.instance-name}-${count.index}"
machine_type = "${var.vm_type["1point7gig"]}"

zone = "${var.region}"
...
...
```

## Running it

```bash
$ terraform plan
$ terraform apply
```

## Appendix

```bash
$ gcloud compute machine-types list | grep us-west1-a
f1-micro        us-west1-a              1     0.60
g1-small        us-west1-a              1     1.70
n1-standard-1   us-west1-a              1     3.75
n1-standard-2   us-west1-a              2     7.50
n1-standard-4   us-west1-a              4     15.00
n1-standard-8   us-west1-a              8     30.00
n1-standard-16  us-west1-a              16    60.00
n1-standard-32  us-west1-a              32    120.00
n1-standard-64  us-west1-a              64    240.00
n1-highcpu-2    us-west1-a              2     1.80
n1-highcpu-4    us-west1-a              4     3.60
n1-highcpu-8    us-west1-a              8     7.20
n1-highcpu-16   us-west1-a              16    14.40
n1-highcpu-32   us-west1-a              32    28.80
n1-highcpu-64   us-west1-a              64    57.60
n1-highmem-2    us-west1-a              2     13.00
n1-highmem-4    us-west1-a              4     26.00
n1-highmem-8    us-west1-a              8     52.00
n1-highmem-16   us-west1-a              16    104.00
n1-highmem-32   us-west1-a              32    208.00
n1-highmem-64   us-west1-a              64    416.00
```

```bash
$ gcloud compute images list
NAME                                              PROJECT            FAMILY                    DEPRECATED  STATUS
centos-6-v20170816                                centos-cloud       centos-6                              READY
centos-7-v20170816                                centos-cloud       centos-7                              READY
coreos-alpha-1506-0-0-v20170817                   coreos-cloud       coreos-alpha                          READY
coreos-beta-1492-5-0-v20170817                    coreos-cloud       coreos-beta                           READY
coreos-stable-1465-6-0-v20170817                  coreos-cloud       coreos-stable                         READY
debian-8-jessie-v20170816                         debian-cloud       debian-8                              READY
debian-9-stretch-v20170816                        debian-cloud       debian-9                              READY
cos-beta-61-9765-31-0                             cos-cloud          cos-beta                              READY
cos-dev-62-9851-0-0                               cos-cloud          cos-dev                               READY
cos-stable-59-9460-73-0                           cos-cloud          cos-stable                            READY
cos-stable-60-9592-84-0                           cos-cloud          cos-stable                            READY
rhel-6-v20170816                                  rhel-cloud         rhel-6                                READY
rhel-7-v20170816                                  rhel-cloud         rhel-7                                READY
sles-11-sp4-v20170621                             suse-cloud         sles-11                               READY
sles-12-sp2-v20170620                             suse-cloud         sles-12                               READY
sles-12-sp1-sap-v20170620                         suse-sap-cloud     sles-12-sp1-sap                       READY
sles-12-sp2-sap-v20170620                         suse-sap-cloud     sles-12-sp2-sap                       READY
ubuntu-1404-trusty-v20170818                      ubuntu-os-cloud    ubuntu-1404-lts                       READY
ubuntu-1604-xenial-v20170815a                     ubuntu-os-cloud    ubuntu-1604-lts                       READY
ubuntu-1704-zesty-v20170811                       ubuntu-os-cloud    ubuntu-1704                           READY
windows-server-2008-r2-dc-v20170808               windows-cloud      windows-2008-r2                       READY
windows-server-2012-r2-dc-core-v20170808          windows-cloud      windows-2012-r2-core                  READY
windows-server-2012-r2-dc-v20170808               windows-cloud      windows-2012-r2                       READY
windows-server-2016-dc-core-v20170808             windows-cloud      windows-2016-core                     READY
windows-server-2016-dc-v20170808                  windows-cloud      windows-2016                          READY
sql-2012-enterprise-windows-2012-r2-dc-v20170808  windows-sql-cloud  sql-ent-2012-win-2012-r2              READY
sql-2012-standard-windows-2012-r2-dc-v20170808    windows-sql-cloud  sql-std-2012-win-2012-r2              READY
sql-2012-web-windows-2012-r2-dc-v20170808         windows-sql-cloud  sql-web-2012-win-2012-r2              READY
sql-2014-enterprise-windows-2012-r2-dc-v20170808  windows-sql-cloud  sql-ent-2014-win-2012-r2              READY
sql-2014-enterprise-windows-2016-dc-v20170808     windows-sql-cloud  sql-ent-2014-win-2016                 READY
sql-2014-standard-windows-2012-r2-dc-v20170808    windows-sql-cloud  sql-std-2014-win-2012-r2              READY
sql-2014-web-windows-2012-r2-dc-v20170808         windows-sql-cloud  sql-web-2014-win-2012-r2              READY
sql-2016-enterprise-windows-2012-r2-dc-v20170808  windows-sql-cloud  sql-ent-2016-win-2012-r2              READY
sql-2016-enterprise-windows-2016-dc-v20170808     windows-sql-cloud  sql-ent-2016-win-2016                 READY
sql-2016-express-windows-2012-r2-dc-v20170808     windows-sql-cloud  sql-exp-2016-win-2012-r2              READY
sql-2016-express-windows-2016-dc-v20170808        windows-sql-cloud  sql-exp-2016-win-2016                 READY
sql-2016-standard-windows-2012-r2-dc-v20170808    windows-sql-cloud  sql-std-2016-win-2012-r2              READY
sql-2016-standard-windows-2016-dc-v20170808       windows-sql-cloud  sql-std-2016-win-2016                 READY
sql-2016-web-windows-2012-r2-dc-v20170808         windows-sql-cloud  sql-web-2016-win-2012-r2              READY
sql-2016-web-windows-2016-dc-v20170808            windows-sql-cloud  sql-web-2016-win-2016                 READY
```