#
# Copyright 2022 Wells Fargo & Microsoft. All rights reserved.
#

# -
# - Required Terraform providers & versions
# -
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.89.0"
    }
  }
}
