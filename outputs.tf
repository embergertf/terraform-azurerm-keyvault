#
# Copyright 2024 Emmanuel Bergerat
#

# ############################   Key vault   ############################
output "id" {
  value       = azurerm_key_vault.this.id
  description = "The Key Vault ID."
}
output "vault_uri" {
  value       = azurerm_key_vault.this.vault_uri
  description = "The URI of the Key Vault."
}

/*
# ############################   Debug                ############################
output "name" {
  value       = module.st_name.name
  description = "Key vault name."
}
output "location" {
  value       = module.st_name.location
  description = "Key vault location."
}
output "random_suffix" {
  value       = module.st_name.random_suffix
  description = "Randomized piece of the Key vault name when \"`add_random = true`\"."
}
output "naming_module_tags" {
  value       = module.st_name.tags
  description = "Naming module tags."
}
#*/
