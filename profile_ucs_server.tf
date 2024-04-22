resource "intersight_server_profile" "pilgrim" {
  name = "pilgrim"

  lifecycle { ignore_changes = [
    server_assignment_mode
  ] }

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

  policy_bucket { # BIOS
    moid        = intersight_bios_policy.linux.moid
    object_type = intersight_bios_policy.linux.object_type
  }

  policy_bucket { # Boot Order
    moid        = intersight_boot_precision_policy.pilgrim.moid
    object_type = intersight_boot_precision_policy.pilgrim.object_type
  }

  policy_bucket { # Power
    moid        = intersight_power_policy.grid_last_state.moid
    object_type = intersight_power_policy.grid_last_state.object_type
  }

  policy_bucket { # Virtual Media
    moid        = intersight_vmedia_policy.vmedia_enabled.moid
    object_type = intersight_vmedia_policy.vmedia_enabled.object_type
  }

  policy_bucket { # IMC Access
    moid        = intersight_access_policy.inband_imc.moid
    object_type = intersight_access_policy.inband_imc.object_type
  }

  policy_bucket { # Local User
    moid        = intersight_iam_end_point_user_policy.default.moid
    object_type = intersight_iam_end_point_user_policy.default.object_type
  }

  policy_bucket { # Virtual KVM
    moid        = intersight_kvm_policy.default.moid
    object_type = intersight_kvm_policy.default.object_type
  }

  policy_bucket { # Storage
    moid        = intersight_storage_storage_policy.m2_raid1.moid
    object_type = intersight_storage_storage_policy.m2_raid1.object_type
  }

  policy_bucket { # LAN Connectivity
    moid        = intersight_vnic_lan_connectivity_policy.pilgrim.moid
    object_type = intersight_vnic_lan_connectivity_policy.pilgrim.object_type
  }
}
