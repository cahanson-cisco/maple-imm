resource "intersight_fabric_eth_network_group_policy" "esxi_mgmt" {
  name = "esxi_mgmt"
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

  vlan_settings {
    native_vlan   = var.network_map_nxos["nxos-804"].vlan
    allowed_vlans = join(",", [for e in var.network_map_nxos: e.vlan])
  }
}

resource "intersight_fabric_eth_network_group_policy" "pilgrim" {
  name = "pilgrim"
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

  vlan_settings {
    native_vlan   = var.network_map_nxos["nxos-840"].vlan
    allowed_vlans = var.network_map_nxos["nxos-840"].vlan
  }
}