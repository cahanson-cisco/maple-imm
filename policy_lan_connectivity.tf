resource "intersight_vnic_lan_connectivity_policy" "pilgrim" {
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

  placement_mode  = "custom"
  target_platform = "FIAttached"
}

resource "intersight_vnic_eth_if" "pilgrim-failover" {
  name = "pilgrim-failover"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  order            = 0
  mac_address_type = "POOL"
  failover_enabled = "true"


  mac_pool {
    moid = intersight_macpool_pool.maple-mac-failover.moid
  }

  placement {
    switch_id = "A"
    id        = "MLOM"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.pilgrim.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.default.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.default["be"].moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.default.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.pilgrim.moid
  }
}
