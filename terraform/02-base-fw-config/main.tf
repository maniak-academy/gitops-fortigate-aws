
resource "fortios_firewall_address" "csvpcsubnet" {
  vdomparam               = "FG-traffic"
  name                 = "csvpcsubnet"
  associated_interface = "awsgeneve"
  subnet               = "20.1.0.0 255.0.0.0"
  type                 = "subnet"
  visibility           = "enable"
}

resource "fortios_firewall_policy" "outgoingrule" {
  vdomparam               = "FG-traffic"
  action                      = "accept"
  inspection_mode             = "flow"
  logtraffic                  = "all"
  name                        = "outboundrule"
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
      name = "all"
  }

  srcaddr {
      name = fortios_firewall_address.csvpcsubnet.name
  }

  srcintf {
      name = "awsgeneve"
  }
}

