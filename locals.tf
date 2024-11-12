#
# Copyright 2024 - Emmanuel Bergerat
#

# Region
locals {
  now             = timestamp()                                                                    # in UTC
  nowUTCFormatted = "${formatdate("YYYY-MM-DD", local.now)}T${formatdate("hh:mm:ss", local.now)}Z" # "2029-01-01T01:01:01Z"
}
