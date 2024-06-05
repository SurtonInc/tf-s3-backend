# S3 backend for Terraform

Creates a s3 bucket and dynamodb table to use as terraform backend.

- dynamodb_table_name = terraform-lock
- s3_bucket_name = <account_id>-terraform-states

## usage

```shell
# make sure you are on the right aws account
pip install awscli
aws s3 ls

# If you don't set default region in your aws configuration, and you want to create the resources in region "us-east-1"
export AWS_DEFAULT_REGION=us-east-1
export AWS_REGION=us-east-1

# Dry-run
terraform init
terraform plan

# apply the change
terraform apply
```

## implementation

Copy this module into a new terraform project and do the following

```shell
# Change the AWS_PROFILE to match your profile name
echo "export AWS_PROFILE=\"replace-me\"\nexport AWS_REGION=\"us-east-1\"" > .envrc
direnv allow
# first time setup, we need to create our s3 & dynamo backend
cd s3-backend
terraform init
terraform plan
terraform apply
cd ..
# now we can provision our environment
terraform init -backend-config=config.s3.tfbackend
terraform plan
terraform apply
```
