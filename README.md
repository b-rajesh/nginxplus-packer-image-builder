# nginxplus-packer-image-builder
This project is to build nginx plus images for GCP, AWS &amp; Azure using packer

## *** Pre requisite *** 
```
obtain nginx-repo.crt & nginx-repo.key and place it in the root folder.
Replace  values in the relevant .json in the variables section with your `client_id`  or `client_secret`  or `project_id` , `region` or other variables. 
```

## Base nginx plus project used 
    You don't have to check-out this project(explicitly) as it would be automatically used while building the nginx plus vm image
    https://github.com/b-rajesh/diy-nginx-plus-api-gateway
    
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
## To create nginx plus image in azure

### Make sure you have az login completed with azure
```sh
$ az login
```
### Create resource group using the below az command and get the subscription id
```sh
$ az account list-locations --output table # To get your loation name for your region
$ az group create -n <Your-unique-Resource-Group-Name>  -l <Your-preferred-location> 
$ az account show --query "{ subscription_id: id }" 
```
### Make sure you have entered your subscription_id, location & resource_group_name in the nginxplus_azure.json
```
    "location": "<Your-preferred-location>",
    "subscription_id": "<Your-subscription-id> ",
    "resource_group_name": "<Your-unique-Resource-Group-Name>",
```
### Run Packer command to build image in azure
```sh
$ packer build nginxplus_azure.json
```
#### You would be asked to open the microsoft web page to enter a unique code to trust packer, it would look like the below in the command line
```
==> azure-arm: Microsoft Azure: To sign in, use a web browser to open the page https://microsoft.com/devicelogin and enter the code XXXXXXXXX to authenticate.
```

### Output of Azure image build - If the build is successful
```
Build 'azure-arm' finished.

==> Builds finished. The artifacts of successful builds are:
--> azure-arm: Azure.ResourceManagement.VMImage:

OSType: Linux
ManagedImageResourceGroupName: <Your-unique-Resource-Group-Name>
ManagedImageName: ngx-plus-r22
ManagedImageId: <You-Managed-ID>
ManagedImageLocation: <Your-location>
```
