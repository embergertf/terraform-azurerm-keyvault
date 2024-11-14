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
output "tags" {
  value       = azurerm_key_vault.this.tags
  description = "Key vault tags."
}
output "random_suffix" {
  value       = module.base.random_suffix
  description = "Randomized piece of the Key vault name when \"`add_random = true`\"."
}
output "naming_values" {
  value       = module.base.naming_values
  description = "A terraform object with the naming values in 1 variable."
}


# ############################   Debug                ############################
output "base_name" {
  value       = module.base.name
  description = "Base module name."
}
output "base_location" {
  value       = module.base.location
  description = "Base module location."
}
output "base_random_suffix" {
  value       = module.base.random_suffix
  description = "Base module randomized piece the name when \"`add_random = true`\"."
}
output "base_tags" {
  value       = module.base.tags
  description = "Base module tags."
}
#*/
