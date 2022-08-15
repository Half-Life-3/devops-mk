# terraform {
#     required_providers {
#       aws = {
#         source = "hashicorp/aws"
#         version = "> 3.0"
#       }
#     }
# }

terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.23.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

