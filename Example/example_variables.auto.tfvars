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
  additional_name = "kv"
  iterator        = "01"
  owner           = "Emm"
  additional_tags = {
    GitHub_org = "gopher194/embergertf"
    Module     = "keyvault"
    Purpose    = "Terraform modules development"
    Test_by    = "Emm"
  }
}

add_random = true
rnd_length = 5

kv_additional_tags = {
  Added_by = "kv_module_localtest"
}

deploy_validation_secret = true
