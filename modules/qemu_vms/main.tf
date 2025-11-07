
resource "proxmox_vm_qemu" "vm" {
  name        = var.configs.name
  target_node = var.target_node
  vmid        = var.vmid
  vm_state    = var.vm_state

  agent      = var.agent
  boot       = var.boot
  memory     = var.memory
  balloon    = var.balloon
  scsihw     = var.scsihw
  skip_ipv6  = var.skip_ipv6

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  disk {
    type = "cdrom"
    iso  = var.cdrom_iso
    slot = "ide0"
  }

  disk {
    type     = "disk"
    format   = var.disk_format
    iothread = var.disk_iothread
    size     = var.disk_size
    slot     = "virtio0"
    storage  = var.disk_storage
  }

  network {
    id        = var.network_id
    bridge    = var.network_bridge
    firewall  = var.network_firewall
    link_down = var.network_link_down
    model     = var.network_model
  }
}
