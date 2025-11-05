
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
  pm_api_url = "https://virt1.lan.thenickstrick.com:8006/api2/json"
  pm_debug      = true
  pm_log_enable = true
  pm_log_file   = "terraform-plugin-proxmox.log"
  pm_log_levels = {
    _default    = "debug"
    _capturelog = ""
  }
}

resource "proxmox_vm_qemu" "tc1" {
  name        = "tc1"
  target_node = "virt1"
  vmid = 1071
  vm_state = "stopped"

  agent = 1
# TODO - use proper boot order with correct device reference
  boot = "order=ide2"
  memory = 4096
  balloon = 0          
  scsihw = "virtio-scsi-single"
  skip_ipv6 = true

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

# TODO - fix disk controller and device types
  disks {
    ide {
      ide2 {
        cdrom {
          iso = "local:iso/talos-amd64.iso"
        }
      }
    }
    virtio {
      virtio0 {
        disk {
          cache = "none"
          format = "raw"
          size = 200
          storage = "virt1-stor"
        }
      }
    }

  }

  network {
      id = 0
      bridge    = "vmbr0"
      firewall  = true
      link_down = false
      model     = "virtio"
  }
  
}
