
# provider docs: https://registry.terraform.io/providers/Telmate/proxmox/latest/docs
terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.2-rc05"
    }
  }
}

provider "proxmox" {
  pm_api_url    = "https://virt1.lan.thenickstrick.com:8006/api2/json"
  pm_debug      = true
  pm_log_enable = true
  pm_log_file   = "tf-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}
