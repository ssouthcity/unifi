data "unifi_firewall_zone" "internal" {
  name = "Internal"
}

data "unifi_firewall_zone" "hotspot" {
  name = "Hotspot"
}

data "unifi_firewall_zone" "dmz" {
  name = "Dmz"
}

resource "unifi_network" "management" {
  name   = "Management"
  subnet = "10.0.1.1/24"

  firewall_zone_id = data.unifi_firewall_zone.internal.id

  dhcp_server = {
    enabled = true
    start   = "10.0.1.6"
    stop    = "10.0.1.254"
  }
}

resource "unifi_network" "home" {
  name   = "Home"
  subnet = "10.0.10.1/24"
  vlan   = 10

  firewall_zone_id = data.unifi_firewall_zone.internal.id

  dhcp_server = {
    enabled = true
    start   = "10.0.10.6"
    stop    = "10.0.10.254"
  }
}

resource "unifi_network" "iot" {
  name   = "IoT"
  subnet = "10.0.20.1/24"
  vlan   = 20

  firewall_zone_id  = data.unifi_firewall_zone.internal.id
  network_isolation = true

  dhcp_server = {
    enabled = true
    start   = "10.0.20.6"
    stop    = "10.0.20.254"
  }
}

resource "unifi_network" "homelab" {
  name   = "Homelab"
  subnet = "10.0.30.1/24"
  vlan   = 30

  firewall_zone_id = data.unifi_firewall_zone.internal.id

  dhcp_server = {
    enabled = true
    start   = "10.0.30.6"
    stop    = "10.0.30.254"
  }
}

resource "unifi_network" "guest" {
  name   = "Guest"
  subnet = "10.0.40.1/24"
  vlan   = 40

  firewall_zone_id = data.unifi_firewall_zone.hotspot.id
  purpose          = "guest"

  dhcp_server = {
    enabled = true
    start   = "10.0.40.6"
    stop    = "10.0.40.254"
  }
}

resource "unifi_network" "storage" {
  name   = "Storage"
  subnet = "10.0.50.1/24"
  vlan   = 50

  firewall_zone_id = data.unifi_firewall_zone.internal.id

  dhcp_server = {
    enabled = true
    start   = "10.0.50.6"
    stop    = "10.0.50.254"
  }
}

resource "unifi_network" "check" {
  name   = "Check"
  subnet = "10.0.60.1/24"
  vlan   = 60

  firewall_zone_id = data.unifi_firewall_zone.internal.id

  dhcp_server = {
    enabled = true
    start   = "10.0.60.6"
    stop    = "10.0.60.254"
  }
}
