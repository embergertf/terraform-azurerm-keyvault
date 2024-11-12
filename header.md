# #{MODULEDISPLAYNAME}# module

## Overview

This #{MODULEDISPLAYNAME}# module provides the following features:
- Deploys a Key vault


## Notes


## Example


```yaml
module "rg_name" {
  # Local use
  #source = "../../terraform-azurerm-base"

  # Terraform Cloud/Enterprise use
  source  = "app.terraform.io/embergertf/base/azurerm"
  version = ">=1.0.0"

  region_code     = "usnc"
  subsc_code      = "azint"
  env             = "dev"
  base_name       = "basemodule"
  additional_name = ""
  iterator        = "01"
  owner           = "john.doe@internet.com"
  additional_tags = {
    app_id  = "1"
    test_by = "emberger"
  }

  # Resource naming inputs
  resource_type_code = "rg"
  max_length         = 64
  no_dashes          = false
  add_random         = true
  rnd_length         = 2
}

```
