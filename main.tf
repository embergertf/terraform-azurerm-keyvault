#
# Copyright 2024 Emmanuel Bergerat
#

# Created  on: #{CREATIONDATE}#
# Created  by: Emmanuel
# Modified on: 
# Modified by: 
# Overview:
#   This #{MODULEDISPLAYNAME}# module:
#   - ,
#   - .
#

# -
# - Generate base for the #{MODULEDISPLAYNAME}# Resource
# -
module "#{MODULECODE}#_base" {
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

  # Random
  add_random = var.add_random
  rnd_length = var.rnd_length

  # #{MODULEDISPLAYNAME}# specifics settings
  resource_type_code = "#{MODULECODE}#"
  max_length         = 90
  no_dashes          = false
}

# -
# - Create the #{MODULEDISPLAYNAME}# Resource
# -
resource "azurerm_resource_group" "this" {
  name     = module.#{MODULECODE}#_base.name
  location = module.#{MODULECODE}#_base.location

  tags = merge(module.#{MODULECODE}#_base.tags, var.additional_tags)
}

