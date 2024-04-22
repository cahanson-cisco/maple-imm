resource "intersight_iam_end_point_user_policy" "default" {
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

  password_properties {
    enforce_strong_password  = false
    enable_password_expiry   = false
    force_send_password      = true
    password_expiry_duration = 1
    password_history         = 0
    notification_period      = 0
    grace_period             = 0
  }
}

resource "intersight_iam_end_point_user" "admin" {
  name = "admin"
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
}

data "intersight_iam_end_point_role" "imc_admin" {
  name      = "admin"
  role_type = "endpoint-admin"
  type      = "IMC"
}

resource "intersight_iam_end_point_user_role" "admin" {
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  enabled  = true
  password = var.imc_local_admin_password

  end_point_user {
    moid = intersight_iam_end_point_user.admin.moid
  }

  end_point_user_policy {
    moid = intersight_iam_end_point_user_policy.default.moid
  }

  end_point_role {
    moid = data.intersight_iam_end_point_role.imc_admin.results[0].moid
  }
}
