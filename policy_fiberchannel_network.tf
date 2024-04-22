resource "intersight_vnic_fc_network_policy" "vsan101" {
  name = "vsan101"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
  organization {
    moid = local.organization
  }

  vsan_settings {
    id = 101
  }
}

resource "intersight_vnic_fc_network_policy" "vsan102" {
  name = "vsan102"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
  organization {
    moid = local.organization
  }

  vsan_settings {
    id = 102
  }
}
