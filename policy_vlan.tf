resource "intersight_fabric_eth_network_policy" "maple-vlans" {
  name = "maple-vlans"
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
}

resource "intersight_fabric_vlan" "vlans_nxos" {
  for_each = var.network_map_nxos

  name = each.key
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  auto_allow_on_uplinks = true
  is_native             = false
  vlan_id               = each.value.vlan

  eth_network_policy {
    moid = intersight_fabric_eth_network_policy.maple-vlans.moid
  }

  multicast_policy {
    moid = intersight_fabric_multicast_policy.default.moid
  }
}