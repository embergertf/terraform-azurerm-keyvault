#
# Copyright 2024 Emmanuel Bergerat
#

# Created  on: 2024-11-11
# Created  by: Emmanuel
# Modified on: 
# Modified by: 
# Overview:
#   This Key vault module:
#   - Generates a name for the Key vault resource
#   - Creates the Key vault resource
#

# -
# - Generate base for the Key vault Resource
# -
# https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/ready/azure-best-practices/resource-abbreviations
# https://learn.microsoft.com/en-us/azure/azure-resource-manager/management/resource-name-rules
module "base" {
  # Terraform Cloud PMR use
  source  = "app.terraform.io/embergertf/base/azurerm"
  version = "~> 4.0"

  # Naming
  name_override = var.name_override
  naming_values = var.naming_values

  region_code     = var.region_code
  subsc_code      = var.subsc_code
  env             = var.env
  base_name       = var.base_name
  additional_name = var.additional_name
  iterator        = var.iterator
  owner           = var.owner
  additional_tags = var.additional_tags

  # Random name generation
  add_random = var.add_random
  rnd_length = var.rnd_length

  # Resource naming inputs
  resource_type_code = "kv"
  max_length         = 24
  no_dashes          = false
}

# -
# - Create the Key vault Resource
# -
resource "azurerm_key_vault" "this" {
  name                = module.base.name
  location            = module.base.location
  resource_group_name = var.resource_group_name

  sku_name  = var.sku_name
  tenant_id = var.tenant_id

  enable_rbac_authorization = true

  purge_protection_enabled        = var.purge_protection_enabled
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment
  enabled_for_deployment          = var.enabled_for_deployment
  public_network_access_enabled   = var.public_network_access_enabled
  soft_delete_retention_days      = var.soft_delete_retention_days

  network_acls {
    bypass                     = "AzureServices"
    default_action             = "Deny"
    ip_rules                   = var.public_internet_ips_to_allow
    virtual_network_subnet_ids = var.virtual_network_subnet_ids
  }

  tags = module.base.tags
  lifecycle { ignore_changes = [tags["BuiltOn"]] }
}


# Creating the validation secret
resource "azurerm_key_vault_secret" "validation_secret" {
  count = var.deploy_validation_secret ? 1 : 0

  name            = "z-validation-secret"
  key_vault_id    = azurerm_key_vault.this.id
  not_before_date = local.nowUTCFormatted

  # depends_on = [
  #   azurerm_role_assignment.terraform_role_to_kv_assignment
  # ]

  value = "===> This is the value of the z-validation-secret from the ${azurerm_key_vault.this.name} keyvault <==="

  tags = merge(azurerm_key_vault.this.tags, tomap({
    "file-encoding" = "utf-8",
  }))
  lifecycle { ignore_changes = [tags["BuiltOn"], not_before_date] }
}
