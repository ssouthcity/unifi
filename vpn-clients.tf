resource "unifi_vpn_client" "homelab" {
  name          = "vpn-client-homelab"
  enabled       = true
  subnet        = "10.2.0.2/32"
  default_route = true
  pull_dns      = false

  wireguard = {
    private_key_wo         = var.homelab_wireguard_private_key
    private_key_wo_version = 1

    interface   = "wan"
    dns_servers = ["10.2.0.1"]

    peer = {
      public_key = "F4aiTD/LLylCVSoyO4pIxX8BuP6t0wS8tKHGAifWdFQ="
      ip         = "79.127.160.129"
      port       = 51820
    }
  }
}

resource "unifi_traffic_route" "vpn_client_homelab" {
  description         = "vpn-client-homelab"
  enabled             = true
  kill_switch_enabled = true
  network_id          = unifi_vpn_client.homelab.id

  source = {
    networks = [{ id = unifi_network.homelab.id }]
  }
}
