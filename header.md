# Key vault module

## Overview

This Key vault module provides the following features:

- Deploys a Key vault
- Deploy a "validation" secret in the Key vault, if specified

## Notes

## Example

```yaml
module "kv_module_localtest" {
  # Local use
  source = "../../terraform-azurerm-keyvault"

  # Naming convention
  naming_values = module.rg.naming_values
  add_random    = true

  # Key vault settings
  resource_group_name = module.rg.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id


  public_internet_ips_to_allow = [module.publicip.public_ip]
  deploy_validation_secret     = var.deploy_validation_secret

  additional_tags = var.kv_additional_tags
}

```
