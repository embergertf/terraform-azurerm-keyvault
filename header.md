# Key vault with Azure role-based access control (RBAC) module

## Overview

This terraform module creates an Azure Key vault and associated resources. Azure Key vault is a cloud service for securely storing and accessing secrets. A secret is anything that you want to tightly control access to, such as API keys, passwords, certificates, or cryptographic keys. This module also enables to grant permissions to user and groups to read and modify the secrets in Key vault.

## Notes

- This module creates the `Key vault` with `RBAC` role enabled.

- Please look in [documentation](https://docs.microsoft.com/en-us/azure/key-vault/general/rbac-guide?tabs=azure-cli) for the available built-in `RBAC` roles for `Key vault`.

- The **Service Principal/User** running this Terraform plan/workspace needs to have **equivalent** or **more than** of the "`User Access Administrator`" role to assign the roles using this module for managing `Key vault`. It allows the use of the `wf-role-assignment` module to assign the "`Key vault Administrator`" role to the **Service Principal/User** running this Terraform plan/workspace.

- This module do not deploy an associated Private Endpoint for the Key vault resource. To create a Private Endpoint for this Key vault, use the `wf-privateendpoints` module after the Key vault creation.

- This module do not have any **Integration with CCKM**. CCKM will register and interact with this Key vault after its creation.

- For testing purposes, the **Networking | Firewall** Allow access from "Selected networks" and public "IP address or CIDR" defined in the variable `network_acls.ip_rules`. This setting should be adjusted when deploying a Key vault in an environment.

## Example

```yaml
#----------------------
# - Creating Key Vault
#----------------------
module "wf_kv" {
  # Terraform Cloud/Enterprise use
  source  = "app.terraform.io/embergertf/keyvault/azurerm"
  version = "~>1.0.0"

  depends_on = [
    module.wf_rg
  ]

  # Key Vault naming Variables
  region_code     = var.main_region_code
  subsc_code      = var.subsc_nickname
  base_name       = "hub"
  additional_name = "terraform"
  iterator        = "01"

  additional_tags = local.base_tags

  # name_override = var.name_override
  # env           = ""
  # owner         = var.owner
  # add_random    = false
  # rnd_length    = 0

  # Key Vault variables
  resource_group_name             = module.wf_rg.name
  enabled_for_deployment          = var.enabled_for_deployment
  enabled_for_disk_encryption     = var.enabled_for_disk_encryption
  enabled_for_template_deployment = var.enabled_for_template_deployment

  secrets      = var.secrets
  network_acls = var.network_acls
}
```
