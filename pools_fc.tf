resource "intersight_fcpool_pool" "maple-wwnn" {
  name = "maple-wwnn"
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

  pool_purpose = "WWNN"
  id_blocks {
    from = "20:00:00:25:b5:b7:20:01"
    size = 255
  }
  lifecycle {
    ignore_changes = [id_blocks]
  }
}

resource "intersight_fcpool_pool" "maple-wwpn-a" {
  name = "brattice-wwpn-a"
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

  pool_purpose = "WWPN"
  id_blocks {
    from = "20:00:00:25:b7:fa:00:01"
    size = 255
  }
  lifecycle {
    ignore_changes = [id_blocks]
  }
}

resource "intersight_fcpool_pool" "maple-wwpn-b" {
  name = "maple-wwpn-b"
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

  pool_purpose = "WWPN"
  id_blocks {
    from = "20:00:00:25:b7:fb:00:01"
    size = 255
  }
  lifecycle {
    ignore_changes = [id_blocks]
  }
}
