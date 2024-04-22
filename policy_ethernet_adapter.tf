resource "intersight_vnic_eth_adapter_policy" "esxi" {
  name = "esxi"
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

  advanced_filter         = false
  interrupt_scaling       = false
  rss_settings            = false
  uplink_failback_timeout = 5

  interrupt_settings {
    coalescing_time = 125
    coalescing_type = "MIN"
    nr_count        = 18
    mode            = "MSIx"
  }

  rss_hash_settings {
    ipv4_hash         = false
    ipv6_hash         = false
    ipv6_ext_hash     = false
    tcp_ipv4_hash     = false
    tcp_ipv6_ext_hash = false
    tcp_ipv6_hash     = false
    udp_ipv4_hash     = false
    udp_ipv6_hash     = false
  }

  completion_queue_settings {
    nr_count = 16
  }

  rx_queue_settings {
    nr_count  = 8
    ring_size = 4096
  }

  tx_queue_settings {
    nr_count  = 8
    ring_size = 4096
  }

  tcp_offload_settings {
    large_receive = true
    large_send    = true
    rx_checksum   = true
    tx_checksum   = true
  }
  arfs_settings {
    enabled = false
  }

  vxlan_settings {
    enabled = false
  }

  nvgre_settings {
    enabled = false
  }

  roce_settings {
    enabled         = false
    memory_regions  = 0
    queue_pairs     = 0
    resource_groups = 0
  }

}

resource "intersight_vnic_eth_adapter_policy" "default" {
  name = "default"
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

  advanced_filter         = false
  interrupt_scaling       = false
  rss_settings            = false
  uplink_failback_timeout = 5

  interrupt_settings {
    coalescing_time = 125
    coalescing_type = "MIN"
    nr_count        = 18
    mode            = "MSIx"
  }

  rss_hash_settings {
    ipv4_hash         = false
    ipv6_hash         = false
    ipv6_ext_hash     = false
    tcp_ipv4_hash     = false
    tcp_ipv6_ext_hash = false
    tcp_ipv6_hash     = false
    udp_ipv4_hash     = false
    udp_ipv6_hash     = false
  }

  completion_queue_settings {
    nr_count = 16
  }

  rx_queue_settings {
    nr_count  = 8
    ring_size = 4096
  }

  tx_queue_settings {
    nr_count  = 8
    ring_size = 4096
  }

  tcp_offload_settings {
    large_receive = true
    large_send    = true
    rx_checksum   = true
    tx_checksum   = true
  }
  arfs_settings {
    enabled = false
  }

  vxlan_settings {
    enabled = false
  }

  nvgre_settings {
    enabled = false
  }

  roce_settings {
    enabled         = false
    memory_regions  = 0
    queue_pairs     = 0
    resource_groups = 0
  }

}