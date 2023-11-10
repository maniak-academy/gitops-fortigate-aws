terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
    fortios = {
      source  = "fortinetdev/fortios"
      version = "1.18.0"
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




module "network" {
  source = "./01-network"
}

# module "basefwconfig" {
#   source = "./02-base-fw-config"
# }


provider "fortios" {
  hostname = module.network.FGTPublicIP
  token    = var.fortios_token
  insecure = "true"
}



# module "services" {
#   source             = "./03-services"
#   fwsshkey           = module.network.fwsshkey
#   customer_vpc_id    = module.network.customer_vpc_id
#   csprivatesubnetaz1 = module.network.csprivatesubnetaz1
# }

# module "advanced" {
#   source             = "./04-advanced"
#   fwsshkey           = module.network.fwsshkey
#   customer_vpc_id    = module.network.customer_vpc_id
#   csprivatesubnetaz1 = module.network.csprivatesubnetaz1
#   csprivatesubnetaz2 = module.network.csprivatesubnetaz2
# }