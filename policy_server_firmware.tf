resource "intersight_firmware_policy" "pilgrim-firmware" {
  name = "pilgrim-firmware"
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

  target_platform = "FIAttached"

  model_bundle_combo {
    model_family   = "UCSX-210C-M6"
    bundle_version = "5.2(1.240010)"
  }
}