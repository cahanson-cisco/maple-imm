resource "intersight_fabric_fc_zone_policy" "SILVER-A" {
  name = "SILVER-A"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  lifecycle { ignore_changes = [
    fc_target_members
  ] }

  organization {
    moid = local.organization
  }

  fc_target_zoning_type = "SIMT"
  fc_target_members = [{
    name                  = "purect0fc0"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    switch_id             = "A"
    vsan_id               = 101
    wwpn                  = "52:4A:93:71:20:FF:59:00"
    },
    {
      name                  = "purect0fc1"
      additional_properties = ""
      class_id              = ""
      object_type           = ""
      switch_id             = "A"
      vsan_id               = 101
      wwpn                  = "52:4a:93:71:20:ff:59:10"
  }]
}

resource "intersight_fabric_fc_zone_policy" "SILVER-B" {
  name = "SILVER-B"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  lifecycle { ignore_changes = [
    fc_target_members
  ] }

  organization {
    moid = local.organization
  }

  fc_target_zoning_type = "SIMT"
  fc_target_members = [{
    name                  = "purect1fc0"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    switch_id             = "B"
    vsan_id               = 102
    wwpn                  = "52:4a:93:71:20:ff:59:01"
    }, {
    name                  = "purect1fc1"
    additional_properties = ""
    class_id              = ""
    object_type           = ""
    switch_id             = "B"
    vsan_id               = 102
    wwpn                  = "52:4a:93:71:20:ff:59:11"
  }]
}
