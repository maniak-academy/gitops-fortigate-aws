terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.23.1"
    }
  }
}
  terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "fortis3-terraform-state"
    key            = "tfstate-s3-bucket"
    region         = "eu-west-1"
    dynamodb_table = "fortis3-terraform-state-lock-dynamo"
  }
}
provider "aws" {
  region = "eu-west-1"
}

module "infra" {
  source = "./infra"
}

module "app" {
  source = "./app"
  csprivatecidraz1_subnet_id = module.infra.csprivatesubnetaz1
  fwsshkey = module.infra.fwsshkey
  customer_vpc_id = module.infra.customer_vpc_id
}
