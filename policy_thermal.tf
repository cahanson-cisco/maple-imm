resource "intersight_thermal_policy" "thermal" {
  for_each = toset(["Balanced", "LowPower", "HighPower", "MaximumPower", "Acoustic"])

  name = lower(each.key)
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

  fan_control_mode = each.key
}
