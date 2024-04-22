locals {
  tags = {
    Automation = "Terraform"
    Project    = "MAPLE-IMM"
    Repo       = "https://github.com/cahanson-cisco/maple-imm"
  }
  organization = data.intersight_organization_organization.default.results[0].moid
}
