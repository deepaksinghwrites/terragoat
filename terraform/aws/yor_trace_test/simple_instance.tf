terraform {


  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

data "aws_caller_identity" "current" {}


locals {
  account_id = data.aws_caller_identity.current.account_id
}


output "account_id" {
  value = local.account_id
}


resource "random_id" "rando" {
  byte_length = 8
}


resource "aws_s3_bucket" "dockingbaywithdeepak" {
  bucket = "${local.account_id}-my-s3-bucket-${random_id.rando.hex}"


  tags = {
    Name                 = "Docking Bay w deepak"
    Environment          = "Dev"
    yor_name             = "dockingbaywithdeepak"
    yor_trace            = "4bfbf26a-d3c9-45f7-a0de-5ba17ac3ee5e"
    git_commit           = "acd156e97a7c59a425ba563d340b2cb8d934a6ca"
    git_file             = "terraform/aws/yor_trace_test/simple_instance.tf"
    git_last_modified_at = "2023-09-13 16:21:55"
    git_last_modified_by = "dsingh.gtmba18@gmail.com"
    git_modifiers        = "dsingh.gtmba18"
    git_org              = "deepaksinghwrites"
    git_repo             = "terragoat"
  }
}

