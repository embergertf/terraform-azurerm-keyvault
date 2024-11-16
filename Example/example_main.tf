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

  # Naming convention
  naming_values = var.naming_values
}

module "publicip" {
  source  = "app.terraform.io/embergertf/publicip/http"
  version = "~> 1.0"
}


module "kv_module_localtest" {
  # Local use
  source = "../../terraform-azurerm-keyvault"

  # Naming convention
  naming_values = var.naming_values
  add_random    = var.add_random
  rnd_length    = var.rnd_length

  # Key vault settings
  resource_group_name = module.rg.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id


  public_internet_ips_to_allow = [module.publicip.public_ip]
  deploy_validation_secret     = var.deploy_validation_secret

  additional_tags = var.kv_additional_tags
}
