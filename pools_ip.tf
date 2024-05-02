variable "ip_pools_map" {
  type = map(object({
    starting_address = string
    block_size       = number
    netmask          = string
    gateway_address  = string
    primary_dns      = string
    secondary_dns    = string
  }))
  default = {
    kvm_pool_mgmt = {
      starting_address = "10.0.50.61"
      block_size       = 8
      netmask          = "255.255.255.0"
      gateway_address  = "10.0.50.1"
      primary_dns      = ""
      secondary_dns    = ""
    }
    kvm_pool_dns = {
      starting_address = "172.16.170.21"
      block_size       = 8
      netmask          = "255.255.255.0"
      gateway_address  = "172.16.170.1"
      primary_dns      = "172.16.173.11"
      secondary_dns    = "172.16.173.12"
    }
  }
}

resource "intersight_ippool_pool" "ip_pools" {
  for_each = var.ip_pools_map

  name = each.key
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

  assignment_order = "sequential"

  ip_v4_blocks {
    from = each.value.starting_address
    size = each.value.block_size
  }

  ip_v4_config {
    gateway       = each.value.gateway_address
    netmask       = each.value.netmask
    primary_dns   = each.value.primary_dns
    secondary_dns = each.value.secondary_dns
  }

  lifecycle {
    ignore_changes = [ip_v4_blocks]
  }

}
