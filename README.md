# nginxplus-packer-image-builder
This project is to build nginx plus images for GCP, AWS &amp; AKS using packer

## *** Pre requisite *** 
```
obtain nginx-repo.crt & nginx-repo.key and place it in the root folder.
```
## Run the below packer command to create nginx plus image in GCP image repo
```sh
$ packer build nginxplus_gce.json
```

## Run the below packer command to create nginx plus AMI in AWS
```sh
$ packer build nginxplus_aws.json
```

## If the build is successful you would see the following as last line in the output
```
==> Builds finished. The artifacts of successful builds are:
--> ngx-plus: A disk image was created: nginxplus-r22
```