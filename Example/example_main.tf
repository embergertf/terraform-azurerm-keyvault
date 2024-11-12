#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Test Key vault module Main
#--------------------------------------------------------------
#   / Resource Group
module "rg" {
  # Terraform Cloud use
  source  = "app.terraform.io/embergertf/resourcegroup/azurerm"
  version = "~> 2.1"

  # Name override
  # name_override = var.name_override

  # Naming convention
  naming_values = var.naming_values
  # region_code     = var.region_code
  # subsc_code      = var.subsc_code
  # env             = var.env
  # base_name       = var.base_name
  # additional_name = var.additional_name
  # iterator        = var.iterator
  # owner           = var.owner

  # # Random
  # add_random = var.add_random
  # rnd_length = var.rnd_length

  # additional_tags = null
}

module "publicip" {
  source  = "app.terraform.io/embergertf/publicip/http"
  version = "~> 1.0"
}


module "kv_module_localtest" {
  # Local use
  source = "../../terraform-azurerm-keyvault"

  # Naming convention
  naming_values = module.rg.naming_values
  add_random    = true

  # Key vault settings
  resource_group_name = module.rg.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id


  public_internet_ips_to_allow = [module.publicip.public_ip]
  deploy_validation_secret     = var.deploy_validation_secret

  additional_tags = var.kv_additional_tags
}
