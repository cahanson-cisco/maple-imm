resource "intersight_fabric_switch_cluster_profile" "SILVER" {
  name = "SILVER"
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

  type = "instance"
}

resource "intersight_fabric_switch_profile" "SILVER-A" {
  name = "SILVER-A"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  } 
  type = "instance"

  policy_bucket { # System QoS Policy
    moid        = intersight_fabric_system_qos_policy.default.moid
    object_type = intersight_fabric_system_qos_policy.default.object_type
  }

  policy_bucket { # NTP Policy
    moid        = intersight_ntp_policy.default.moid
    object_type = intersight_ntp_policy.default.object_type
  }

  policy_bucket { # Network Connectivity
    moid        = intersight_networkconfig_policy.default.moid
    object_type = intersight_networkconfig_policy.default.object_type
  }

  policy_bucket { # Switch Control Policy
    moid        = intersight_fabric_switch_control_policy.direct-attached.moid
    object_type = intersight_fabric_switch_control_policy.direct-attached.object_type
  }

  policy_bucket { # Port Policy
    moid        = intersight_fabric_port_policy.SILVER-A.moid
    object_type = intersight_fabric_port_policy.SILVER-A.object_type
  }

  policy_bucket { # VSAN Configuration
    moid        = intersight_fabric_fc_network_policy.SILVER-A.moid
    object_type = intersight_fabric_fc_network_policy.SILVER-A.object_type
  }

  policy_bucket { # VLAN Configuration
    moid        = intersight_fabric_eth_network_policy.maple-vlans.moid
    object_type = intersight_fabric_eth_network_policy.maple-vlans.object_type
  }

  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.SILVER.moid
  }
}

resource "intersight_fabric_switch_profile" "SILVER-B" {
  name = "SILVER-B"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  } 
  type = "instance"

  policy_bucket { # System QoS Policy
    moid        = intersight_fabric_system_qos_policy.default.moid
    object_type = intersight_fabric_system_qos_policy.default.object_type
  }

  policy_bucket { # NTP Policy
    moid        = intersight_ntp_policy.default.moid
    object_type = intersight_ntp_policy.default.object_type
  }

  policy_bucket { # Network Connectivity
    moid        = intersight_networkconfig_policy.default.moid
    object_type = intersight_networkconfig_policy.default.object_type
  }

  policy_bucket { # Switch Control Policy
    moid        = intersight_fabric_switch_control_policy.direct-attached.moid
    object_type = intersight_fabric_switch_control_policy.direct-attached.object_type
  }
  
  policy_bucket { # Port Policy
    moid        = intersight_fabric_port_policy.SILVER-B.moid
    object_type = intersight_fabric_port_policy.SILVER-B.object_type
  }

  policy_bucket { # VSAN Configuration
    moid        = intersight_fabric_fc_network_policy.SILVER-B.moid
    object_type = intersight_fabric_fc_network_policy.SILVER-B.object_type
  }

  policy_bucket { # VLAN Configuration
    moid        = intersight_fabric_eth_network_policy.maple-vlans.moid
    object_type = intersight_fabric_eth_network_policy.maple-vlans.object_type
  }

  switch_cluster_profile {
    moid = intersight_fabric_switch_cluster_profile.SILVER.moid
  }
}