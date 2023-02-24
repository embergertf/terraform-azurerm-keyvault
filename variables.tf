#
# Copyright 2022 Wells Fargo & Microsoft. All rights reserved.
#

#--------------------------
# - Dependencies Variables
#--------------------------
variable "resource_group_name" {
  type        = string
  description = "(Required) Name of the Resource Group in which to create the Key vault."
}

#-----------------------------
# Wells Fargo required values
#-----------------------------
variable "env" {
  type        = string
  description = "(Required) Wells Fargo environment code. Example: `test`. <br></br>&#8226; Value of `env` must be one of: `[nonprod,prod,core,int,uat,stage,dev,test]`."
  validation {
    condition     = contains(["nonprod", "prod", "core", "int", "uat", "stage", "dev", "test"], var.env)
    error_message = "Value of \"env\" must be one of: [nonprod,prod,core,int,uat,stage,dev,test]."
  }
}
variable "base_name" {
  type        = string
  description = "(Required) Application/Infrastructure \"base\" name. Example: `aks`."
}
variable "au" {
  type        = string
  description = "(Required) Wells Fargo Accounting Unit (AU) code. Example: `0233985`. <br></br>&#8226; Value of `au` must be of numeric characters."
  validation {
    condition     = can(regex("^[[:digit:]]+$", var.au))
    error_message = "Value for \"au\" must be of numeric characters."
  }
}
variable "owner" {
  type        = string
  description = "(Required) Wells Fargo technology owner group."
}

#--------------------
# Optional Variables
#--------------------
variable "org" {
  type        = string
  description = "(Optional) Wells Fargo organization code. Example: `wf`."
  default     = "wf"
}
variable "country" {
  type        = string
  description = "(Optional) Wells Fargo country code. Example: `us`."
  default     = "us"
}
variable "region_code" {
  type        = string
  description = "(Optional) Wells Fargo region code.<br></br>&#8226; Value of `region_code` must be one of: `[ncus,scus]`."
  validation {
    condition     = contains(["ncus", "scus"], var.region_code)
    error_message = "Value of \"region_code\" must be one of: [ncus,scus]."
  }
  default = "ncus"
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
variable "additional_tags" {
  type        = map(string)
  description = "(Optional) Additional Key Vault resources tags, in addition to the resource group tags"
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
  default     = 3
}

#------------------------
# - Key Vault Properties
#------------------------
variable "enabled_for_deployment" {
  type        = bool
  description = "(Optional) Specifies whether Azure Virtual Machines are permitted to retrieve certificates stored as secrets from the key vault."
  default     = false
}
variable "enabled_for_disk_encryption" {
  type        = bool
  description = "(Optional) Specifies whether Azure Disk Encryption is permitted to retrieve secrets from the vault and unwrap keys."
  default     = false
}
variable "enabled_for_template_deployment" {
  type        = bool
  description = "(Optional) Specifies whether Azure Resource Manager is permitted to retrieve secrets from the key vault."
  default     = false
}

#--------------------------
# - Network Security Rules
#--------------------------
variable "network_acls" {
  type = object({
    bypass                     = string
    default_action             = string
    ip_rules                   = list(string)
    virtual_network_subnet_ids = list(string)
  })
  description = "(Optional) Networking settings for the Key Vault:<br></br><ul><li>`default_action`: (Required) The Default Action to use when no rules match ip_rules / virtual_network_subnet_ids. Possible values are `\"Allow\"` and `\"Deny\"`,</li><li>`bypass`: (Optional) Specifies whether traffic is bypassed for None/AzureServices. Valid options are either of [`\"AzureServices\"`, `\"None\"`],</li><li>`ip_rules`: (Optional) One or more <b>Public IP Addresses or CIDR Blocks</b> which should be able to access the Key Vault,</li><li>`virtual_network_subnet_ids`: (Optional) One or more Subnet IDs which should be able to access the Key Vault.</li></ul>"
  default     = null
}

#---------------------
# - Key Vault Secrets
#---------------------
variable "secrets" {
  type        = map(string)
  description = "(Optional) A map of secrets for the Key Vault"
  default     = {}
}