#
# Copyright 2024 Emmanuel Bergerat
#

# ############################   Key vault   ############################



# ############################   DEBUG                ############################
output "naming_values_var" {
  value       = var.naming_values
  description = "Naming values from variable."
}
output "naming_values_rg" {
  value       = module.rg.naming_values
  description = "Naming values from RG module."
}
output "naming_values_kv" {
  value       = module.kv_module_localtest.naming_values
  description = "Naming values from Key vault module."
}
output "name" {
  value       = module.rg.name
  description = "Key vault name."
}
output "location" {
  value       = module.rg.location
  description = "Key vault location."
}
output "random_suffix" {
  value       = module.rg.random_suffix
  description = "Randomized piece of the Key vault name when \"`add_random = true`\"."
}
output "tags_rg" {
  value       = module.rg.tags
  description = "Resource Group tags."
}
output "tags_kv" {
  value       = module.kv_module_localtest.tags
  description = "Key vault tags."
}
output "tags_base" {
  value       = module.kv_module_localtest.base_tags
  description = "Key vault base module tags."
}
#*/
