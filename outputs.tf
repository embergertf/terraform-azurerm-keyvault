#
# Copyright 2024 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Key vault module outputs
#--------------------------------------------------------------

# ############################   Key vault   ############################
output "name" {
  value       = azurerm_key_vault.this.name
  description = "Key vault name."
}
output "id" {
  value       = azurerm_key_vault.this.id
  description = "Key vault ID."
}
output "location" {
  value       = azurerm_key_vault.this.location
  description = "Key vault location."
}
output "resource_group_name" {
  value       = azurerm_key_vault.this.resource_group_name
  description = "Key vault Resource group name."
}

/*
# ############################   Debug                ############################
output "name" {
  value       = module.kv_base.name
  description = "Key vault name."
}
output "location" {
  value       = module.kv_base.location
  description = "Key vault location."
}
output "random_suffix" {
  value       = module.kv_base.random_suffix
  description = "Randomized piece of the Key vault name when \"`add_random = true`\"."
}
output "naming_module_tags" {
  value       = module.kv_base.tags
  description = "Naming module tags."
}
#*/
