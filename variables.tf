#
# Copyright 2024 Emmanuel Bergerat
#

# ############################   Dependencies         ############################

# / Resource Group for the Key vault
variable "resource_group_name" {
  type        = string
  description = "(Required) Name of the `Resource Group` in which to create the Key vault."
}

# ############################   Required Variables   ############################

variable "tenant_id" {
  type        = string
  description = "(Required) The Azure tenant ID."
}

# ############################   Optional Variables   ############################
# / Naming
variable "name_override" {
  type        = string
  description = "(Optional) Full name to override all the name generation logic. Example: 'biglittletest' will generate the resource group name \"'rg-biglittletest'\"."
  default     = null
}
variable "naming_values" {
  type = object({
    region_code     = string
    subsc_code      = string
    env             = string
    base_name       = string
    additional_name = string
    iterator        = string
    owner           = string
    additional_tags = map(string)
  })
  description = "(Optional) A terraform object with the naming values in 1 variable."
  default     = null
}
variable "region_code" {
  type        = string
  description = "(Optional) Resource region code. Must be compatible with base module. Example: `cac`."
  default     = null
}
variable "subsc_code" {
  type        = string
  description = "(Optional) Subscription code or abbreviation. Example: `azint`."
  default     = null
}
variable "env" {
  type        = string
  description = "(Optional) Environment code. Example: `test`. <br></br>&#8226; Value of `env` examples can be: `[nonprod,prod,core,int,uat,stage,dev,test]`."
  default     = null
}
variable "base_name" {
  type        = string
  description = "(Optional) Resource \"base\" name. Example: `aks`."
  default     = null
}
variable "additional_name" {
  type        = string
  description = "(Optional) Additional suffix to create resource uniqueness. It will be separated by a `'-'` from the \"name's generated\" suffix. Example: `lan1`."
  default     = null
}
variable "iterator" {
  type        = string
  description = "(Optional) Iterator to create resource uniqueness. It will be separated by a `'-'` from the \"name's generated + additional_name\" concatenation. Example: `001`."
  default     = null
}
variable "owner" {
  type        = string
  description = "(Optional) Deployed resources owner."
  default     = null
}
variable "additional_tags" {
  description = "(Optional) Additional tags for the Resource Group."
  type        = map(string)
  default     = null
}
variable "add_random" {
  type        = bool
  description = "(Optional) When set to `true`, it will add a `rnd_length`'s long `random_number` at the name's end."
  default     = false
}
variable "rnd_length" {
  type        = number
  description = "(Optional) Set the length of the `random_number` generated."
  default     = 2
}

# / Key vault
variable "public_internet_ips_to_allow" {
  type        = list(string)
  description = "(Optional) List of public IP addresses to allow to access the Key vault.)"
  default     = []
}
variable "virtual_network_subnet_ids" {
  type        = list(string)
  description = "(Optional) List of Virtual Networks Ids to allow to access the Key vault.)"
  default     = []
}
variable "deploy_validation_secret" {
  type        = bool
  description = "(Optional) When set to `true`, it will deploy a validation secret in the Key vault."
  default     = false
}
variable "sku_name" {
  type        = string
  description = "(Optional) The Name of the SKU used for this Key Vault. Possible values are `standard` and `premium`."
  default     = "standard"
}
variable "purge_protection_enabled" {
  type        = bool
  description = "(Optional) Is Purge Protection enabled for this Key Vault?"
  default     = false
}
variable "enabled_for_disk_encryption" {
  type        = bool
  description = "(Optional) Is Disk Encryption enabled for this Key Vault?"
  default     = true
}
variable "enabled_for_template_deployment" {
  type        = bool
  description = "(Optional) Is Template Deployment enabled for this Key Vault?"
  default     = false
}
variable "enabled_for_deployment" {
  type        = bool
  description = "(Optional) Is Deployment enabled for this Key Vault?"
  default     = false
}
variable "public_network_access_enabled" {
  type        = bool
  description = "(Optional) Is Public Network Access enabled for this Key Vault?"
  default     = true
}
variable "soft_delete_retention_days" {
  type        = number
  description = "(Optional) The number of days that items should be retained for once soft deleted."
  default     = 7
}
