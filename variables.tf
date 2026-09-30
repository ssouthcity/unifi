variable "homelab_wireguard_private_key" {
  type        = string
  description = "Wireguard private key for the homelab subnet"
  sensitive   = true
  ephemeral   = true
}
