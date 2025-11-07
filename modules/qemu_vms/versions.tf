
# provider docs: https://registry.terraform.io/providers/Telmate/proxmox/latest/docs

terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc05"
    }
  }
}
