#
# Copyright 2022 Wells Fargo & Microsoft. All rights reserved.
#

#---------------------------
# - Creating Resource Group
#---------------------------
module "wf_rg" {
  # Terraform Cloud/Enterprise use
  source  = "app.terraform.io/msftwfdeo/wf-resourcegroup/azurerm"
  version = "~>1.0.4" # =1.0.x, with x>=4

  org             = var.org
  country         = var.country
  env             = var.env
  region_code     = var.region_code
  base_name       = var.base_name
  additional_name = var.rg_additional_name
  iterator        = var.iterator

  au              = var.au
  owner           = var.owner
  add_random      = true
  additional_tags = var.rg_additional_tags
}

#----------------------
# - Creating Key Vault
#----------------------
module "wf_kv" {
  # Terraform Cloud/Enterprise use
  # source  = "app.terraform.io/msftwfdeo/wf-keyvault/azurerm"
  # version = "~>2.0.0" # =2.0.x, with x>=0

  # Local Use
  source = "../../terraform-azurerm-wf-keyvault"

  depends_on = [
    module.wf_rg
  ]

  # Key Vault naming Variables
  org             = var.org
  country         = var.country
  env             = var.env
  au              = var.au
  owner           = var.owner
  region_code     = var.region_code
  base_name       = var.base_name
  additional_name = var.kv_additional_name
  add_random      = true
  rnd_length      = var.rnd_length
  additional_tags = var.kv_additional_tags
  iterator        = var.iterator

  # Key Vault variables
  resource_group_name             = module.wf_rg.name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  secrets      = var.secrets
  network_acls = var.network_acls
}
