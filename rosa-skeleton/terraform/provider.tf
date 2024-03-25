provider "aws" {
  region = "${{ values.aws_region }}"
}

terraform {
  backend "s3" {
  }
}
