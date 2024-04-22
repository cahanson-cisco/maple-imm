terraform {
  required_providers {
    intersight = {
      source  = "CiscoDevNet/intersight"
      version = ">= 1.0.45"
    }
  }
}
provider "intersight" {
  apikey    = var.intersight-keyid
  secretkey = var.intersight-secretkey
  endpoint  = "https://intersight.com"
}