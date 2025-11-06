
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
  pm_log_file   = "tf-proxmox.log"
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
  boot = "order=ide0;virtio0"
  memory = 4096
  balloon = 0          
  scsihw = "virtio-scsi-pci"
  skip_ipv6 = true

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  disk {
    type = "cdrom"
    iso = "local:iso/talos-amd64.iso"
    slot = "ide0"
  }

  disk {
    type = "disk"
    format = "raw"
    iothread = true
    size = 200
    slot = "virtio0"
    storage = "virt1-stor"
  }

  network {
      id = 0
      bridge    = "vmbr0"
      firewall  = true
      link_down = false
      model     = "virtio"
  }
}

resource "proxmox_vm_qemu" "tc2" {
  name        = "tc2"
  target_node = "virt2"
  vmid = 1072
  vm_state = "stopped"

  agent = 1
  boot = "order=ide0;virtio0"
  memory = 4096
  balloon = 0          
  scsihw = "virtio-scsi-pci"
  skip_ipv6 = true

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  disk {
    type = "cdrom"
    iso = "local:iso/talos-amd64.iso"
    slot = "ide0"
  }

  disk {
    type = "disk"
    format = "raw"
    iothread = true
    size = 200
    slot = "virtio0"
    storage = "virt2-stor"
  }

  network {
      id = 0
      bridge    = "vmbr0"
      firewall  = true
      link_down = false
      model     = "virtio"
  }
}

resource "proxmox_vm_qemu" "tc3" {
  name        = "tc3"
  target_node = "virt3"
  vmid = 1073
  vm_state = "stopped"

  agent = 1
  boot = "order=ide0;virtio0"
  memory = 4096
  balloon = 0          
  scsihw = "virtio-scsi-pci"
  skip_ipv6 = true

  cpu {
    cores = 2
    type = "x86-64-v2-AES"
  }

  disk {
    type = "cdrom"
    iso = "local:iso/talos-amd64.iso"
    slot = "ide0"
  }

  disk {
    type = "disk"
    format = "raw"
    iothread = true
    size = 200
    slot = "virtio0"
    storage = "virt3-stor"
  }

  network {
      id = 0
      bridge    = "vmbr0"
      firewall  = true
      link_down = false
      model     = "virtio"
  }
}
