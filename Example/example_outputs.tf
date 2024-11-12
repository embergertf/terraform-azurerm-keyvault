#
# Copyright 2024 Emmanuel Bergerat
#

# ############################   #{MODULEDISPLAYNAME}#   ############################



# ############################   DEBUG                ############################
output "naming_values" {
  value       = var.naming_values
  description = "Naming values."
}
output "name" {
  value       = module.rg.name
  description = "#{MODULEDISPLAYNAME}# name."
}
output "location" {
  value       = module.rg.location
  description = "#{MODULEDISPLAYNAME}# location."
}
output "random_suffix" {
  value       = module.rg.random_suffix
  description = "Randomized piece of the #{MODULEDISPLAYNAME}# name when \"`add_random = true`\"."
}
output "rg_tags" {
  value       = module.rg.tags
  description = "Resource Group tags."
}
#*/
