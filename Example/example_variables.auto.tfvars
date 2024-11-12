#
# Copyright 2023 Emmanuel Bergerat
#

#--------------------------------------------------------------
#   Test Key vault module variables' values
#--------------------------------------------------------------
naming_values = {
  region_code     = "uswe2"
  subsc_code      = "714895"
  env             = "dev"
  base_name       = "embergertf"
  additional_name = "keyvault"
  iterator        = "01"
  owner           = "Emm"
  additional_tags = {
    Test_by    = "Emm",
    GitHub_org = "gopher194/embergertf",
    Purpose    = "Terraform modules development"
    Module     = "keyvault"
  }
}

add_random = null
rnd_length = null

kv_additional_tags = {
  Added_by = "kv_module_localtest"
}

deploy_validation_secret = true
