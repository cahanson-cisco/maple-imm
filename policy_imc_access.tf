resource "intersight_access_policy" "inband_imc" {
  name = "inband_imc"
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

  configuration_type {
    configure_inband      = true
    configure_out_of_band = false
  }

  inband_vlan = 850

  inband_ip_pool {
    moid = intersight_ippool_pool.ip_pools["kvm_pool_mgmt"].id
  }
}

resource "intersight_access_policy" "inband_imc_dns" {
  name = "inband_imc_dns"
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

  configuration_type {
    configure_inband      = true
    configure_out_of_band = false
  }

  inband_vlan = 850

  inband_ip_pool {
    moid = intersight_ippool_pool.ip_pools["kvm_pool_dns"].id
  }
}
