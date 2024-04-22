resource "intersight_fabric_fc_network_policy" "SILVER-A" {
  name = "SILVER-A"
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

  enable_trunking = false
}

resource "intersight_fabric_vsan" "vsan101" {
  name = "vsan101"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  lifecycle { ignore_changes = [
    default_zoning
  ] }

  default_zoning = "Enabled"
  vsan_scope     = "Storage"
  fcoe_vlan      = 101
  vsan_id        = 101

  fc_network_policy {
    moid = intersight_fabric_fc_network_policy.SILVER-A.moid
  }
}

resource "intersight_fabric_fc_network_policy" "SILVER-B" {
  name = "SILVER-B"
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

  enable_trunking = false
}

resource "intersight_fabric_vsan" "vsan102" {
  name = "vsan102"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  lifecycle { ignore_changes = [
    default_zoning
  ] }

  default_zoning = "Enabled"
  vsan_scope     = "Storage"
  fcoe_vlan      = 102
  vsan_id        = 102

  fc_network_policy {
    moid = intersight_fabric_fc_network_policy.SILVER-B.moid
  }
}
