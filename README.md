# nginxplus-packer-image-builder
This project is to build nginx plus images for GCP, AWS &amp; AKS using packer

## *** Pre requisite *** 
```
obtain nginx-repo.crt & nginx-repo.key and place it in the root folder.
```

## To create nginx plus image in GCP

### Run the below packer command to create nginx plus image in GCP image repo
```sh
$ packer build nginxplus_gce.json
```

### Output of GCP image packer build - If the build is successful
```
==> Builds finished. The artifacts of successful builds are:
--> ngx-plus: A disk image was created: nginxplus-r22
```

## To create nginx plus AMI in AWS

### Find the right source ami id depends on your region -Below command find latest  ubuntu 18.04 for a owner

```
aws ec2 describe-images \
 --owners 099720109477 \
    --filters 'Name=name,Values=ubuntu/images/hvm-ssd/ubuntu-*-18.04-amd64-server-????????' 'Name=state,Values=available' \
    --query 'reverse(sort_by(Images, &CreationDate))[:1].ImageId' \
    --output text
```
### Set your AWS credentials
```sh
$ export AWS_ACCESS_KEY_ID="Your-AWS-AccessKey"
$ export AWS_SECRET_ACCESS_KEY="Your-AWS-SecretKey"
$ export AWS_DEFAULT_REGION="ap-southeast-2"
```
### Run packer with below command

```sh
$ packer build nginxplus_aws.json
```

### Output of AWS AMI packer build - If the build is successful
```
==> Builds finished. The artifacts of successful builds are:
--> ngx-plus: AMIs were created:
ap-southeast-2: ami-{id}
```
