resource "intersight_ntp_policy" "default" {
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

  enabled  = true
  ntp_servers = [
    "10.0.0.252",
    "10.0.0.253",
  ]
  timezone = "America/Toronto"
}