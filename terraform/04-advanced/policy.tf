
resource "fortios_firewall_policy" "webfront_policy" {
  vdomparam               = "FG-traffic"
  action                      = "accept"
  inspection_mode             = "flow"
  logtraffic                  = "all"
  name                        = "webfront_policy"
  schedule                    = "always"
  ssl_ssh_profile             = "no-inspection"
  status                      = "enable"
  utm_status                  = "enable"
  nat                           = "disable"
  
  dstintf {
      name = "awsgeneve"
  }

  service {
    name = "ALL"
  }
  dstaddr {
      name = fortios_firewall_address.fakeapp_front_address.name
  }

  srcaddr {
      name = "all"
  }

  srcintf {
      name = "awsgeneve"
  }
}


