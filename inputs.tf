variable "aws_profile" {
  description = "Name of AWS credentials profile trusted to provision resources as the Role ARN with the AWS Terraform Provider"
  type        = string
  default     = ""
}

variable "aws_region" {
  description = "Name of AWS region to use with the AWS Terraform Provider"
  type        = string
  default     = "us-east-1"
}
