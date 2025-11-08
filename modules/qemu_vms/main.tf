
resource "proxmox_vm_qemu" "vm" {

  agent       = var.agent
  balloon     = var.balloon
  boot        = var.boot
  memory      = var.memory
  name        = var.name
  scsihw      = var.scsihw
  skip_ipv6   = var.skip_ipv6
  target_node = var.target_node
  vmid        = var.vmid
  vm_state    = var.vm_state

  cpu {
    cores = var.cpu_cores
    type  = var.cpu_type
  }

  disk {
    iso  = var.cdrom_iso
    slot = "ide0"
    type = "cdrom"
  }

  disk {
    format   = var.disk_format
    iothread = var.disk_iothread
    size     = var.disk_size
    slot     = "virtio0"
    storage  = var.disk_storage
    type     = "disk"
  }

  network {
    bridge    = var.network_bridge
    firewall  = var.network_firewall
    id        = var.network_id
    link_down = var.network_link_down
    macaddr   = var.network_macaddr
    model     = var.network_model
  }
}
