variable "network_map_nxos" {
  type = map(object({
    vlan = number
    qos  = string
  }))
  default = {
    nxos-804 = {
      vlan = 804
      qos  = "be"
    }
    nxos-810 = {
      vlan = 810
      qos  = "be"
    }
    nxos-840 = {
      vlan = 840
      qos  = "be"
    }
    nxos-850 = {
      vlan = 850
      qos  = "be"
    }
  }
}