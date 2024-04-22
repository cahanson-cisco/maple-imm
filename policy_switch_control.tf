resource "intersight_fabric_switch_control_policy" "direct-attached" {
  name = "direct-attached"
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
  fc_switching_mode = "switch"
}
