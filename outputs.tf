#
# Copyright 2024 Emmanuel Bergerat
#

# ############################   #{MODULEDISPLAYNAME}#   ############################



/*
# ############################   Debug                ############################
output "name" {
  value       = module.st_name.name
  description = "#{MODULEDISPLAYNAME}# name."
}
output "location" {
  value       = module.st_name.location
  description = "#{MODULEDISPLAYNAME}# location."
}
output "random_suffix" {
  value       = module.st_name.random_suffix
  description = "Randomized piece of the #{MODULEDISPLAYNAME}# name when \"`add_random = true`\"."
}
output "naming_module_tags" {
  value       = module.st_name.tags
  description = "Naming module tags."
}
#*/
