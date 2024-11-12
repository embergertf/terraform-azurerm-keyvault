<!-- BEGIN_TF_DOCS -->
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

## Documentation
<!-- markdownlint-disable MD033 -->

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 4.7 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kv_base"></a> [kv\_base](#module\_kv\_base) | app.terraform.io/embergertf/base/azurerm | ~> 4.0 |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_resource_group_name"></a> [resource\_group\_name](#input\_resource\_group\_name) | (Required) Name of the `Resource Group` in which to create the Key vault. | `string` | n/a | yes |
| <a name="input_tenant_id"></a> [tenant\_id](#input\_tenant\_id) | (Required) The Azure tenant ID. | `string` | n/a | yes |
| <a name="input_add_random"></a> [add\_random](#input\_add\_random) | (Optional) When set to `true`, it will add a `rnd_length`'s long `random_number` at the name's end. | `bool` | `false` | no |
| <a name="input_additional_name"></a> [additional\_name](#input\_additional\_name) | (Optional) Additional suffix to create resource uniqueness. It will be separated by a `'-'` from the "name's generated" suffix. Example: `lan1`. | `string` | `null` | no |
| <a name="input_additional_tags"></a> [additional\_tags](#input\_additional\_tags) | (Optional) Additional tags for the Resource Group. | `map(string)` | `null` | no |
| <a name="input_base_name"></a> [base\_name](#input\_base\_name) | (Optional) Resource "base" name. Example: `aks`. | `string` | `null` | no |
| <a name="input_deploy_validation_secret"></a> [deploy\_validation\_secret](#input\_deploy\_validation\_secret) | (Optional) When set to `true`, it will deploy a validation secret in the Key vault. | `bool` | `false` | no |
| <a name="input_enabled_for_deployment"></a> [enabled\_for\_deployment](#input\_enabled\_for\_deployment) | (Optional) Is Deployment enabled for this Key Vault? | `bool` | `false` | no |
| <a name="input_enabled_for_disk_encryption"></a> [enabled\_for\_disk\_encryption](#input\_enabled\_for\_disk\_encryption) | (Optional) Is Disk Encryption enabled for this Key Vault? | `bool` | `true` | no |
| <a name="input_enabled_for_template_deployment"></a> [enabled\_for\_template\_deployment](#input\_enabled\_for\_template\_deployment) | (Optional) Is Template Deployment enabled for this Key Vault? | `bool` | `false` | no |
| <a name="input_env"></a> [env](#input\_env) | (Optional) Environment code. Example: `test`. <br></br>&#8226; Value of `env` examples can be: `[nonprod,prod,core,int,uat,stage,dev,test]`. | `string` | `null` | no |
| <a name="input_iterator"></a> [iterator](#input\_iterator) | (Optional) Iterator to create resource uniqueness. It will be separated by a `'-'` from the "name's generated + additional\_name" concatenation. Example: `001`. | `string` | `null` | no |
| <a name="input_name_override"></a> [name\_override](#input\_name\_override) | (Optional) Full name to override all the name generation logic. Example: 'biglittletest' will generate the resource group name "'rg-biglittletest'". | `string` | `null` | no |
| <a name="input_naming_values"></a> [naming\_values](#input\_naming\_values) | (Optional) A terraform object with the naming values in 1 variable. | <pre>object({<br>    region_code     = string<br>    subsc_code      = string<br>    env             = string<br>    base_name       = string<br>    additional_name = string<br>    iterator        = string<br>    owner           = string<br>    additional_tags = map(string)<br>  })</pre> | `null` | no |
| <a name="input_owner"></a> [owner](#input\_owner) | (Optional) Deployed resources owner. | `string` | `null` | no |
| <a name="input_public_internet_ips_to_allow"></a> [public\_internet\_ips\_to\_allow](#input\_public\_internet\_ips\_to\_allow) | (Optional) List of public IP addresses to allow to access the Key vault.) | `list(string)` | `[]` | no |
| <a name="input_public_network_access_enabled"></a> [public\_network\_access\_enabled](#input\_public\_network\_access\_enabled) | (Optional) Is Public Network Access enabled for this Key Vault? | `bool` | `true` | no |
| <a name="input_purge_protection_enabled"></a> [purge\_protection\_enabled](#input\_purge\_protection\_enabled) | (Optional) Is Purge Protection enabled for this Key Vault? | `bool` | `true` | no |
| <a name="input_region_code"></a> [region\_code](#input\_region\_code) | (Optional) Resource region code. Must be compatible with base module. Example: `cac`. | `string` | `null` | no |
| <a name="input_rnd_length"></a> [rnd\_length](#input\_rnd\_length) | (Optional) Set the length of the `random_number` generated. | `number` | `2` | no |
| <a name="input_sku_name"></a> [sku\_name](#input\_sku\_name) | (Optional) The Name of the SKU used for this Key Vault. Possible values are `standard` and `premium`. | `string` | `"standard"` | no |
| <a name="input_soft_delete_retention_days"></a> [soft\_delete\_retention\_days](#input\_soft\_delete\_retention\_days) | (Optional) The number of days that items should be retained for once soft deleted. | `number` | `7` | no |
| <a name="input_subsc_code"></a> [subsc\_code](#input\_subsc\_code) | (Optional) Subscription code or abbreviation. Example: `azint`. | `string` | `null` | no |
| <a name="input_virtual_network_subnet_ids"></a> [virtual\_network\_subnet\_ids](#input\_virtual\_network\_subnet\_ids) | (Optional) List of Virtual Networks Ids to allow to access the Key vault.) | `list(string)` | `[]` | no |

### Resources

| Name | Type |
|------|------|
| [azurerm_key_vault.this](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault) | resource |
| [azurerm_key_vault_secret.validation_secret](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/key_vault_secret) | resource |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_id"></a> [id](#output\_id) | The Key Vault ID. |
| <a name="output_vault_uri"></a> [vault\_uri](#output\_vault\_uri) | The URI of the Key Vault. |

<!-- END_TF_DOCS -->