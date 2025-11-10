
locals {
  # Create a map of virtio disks for the disks block
  virtio_disks = {
    for disk in var.disks :
    disk.slot => {
      disk = {
        format   = disk.format
        iothread = disk.iothread
        size     = disk.size
        storage  = disk.storage
      }
    }
    if can(regex("^virtio", disk.slot))
  }
}

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

  dynamic "disk" {
    for_each = var.cdrom_iso != "" ? [1] : []
    content {
      iso  = var.cdrom_iso
      slot = "ide0"
      type = "cdrom"
    }
  }

  disks {
    virtio {
      dynamic "virtio0" {
        for_each = lookup(local.virtio_disks, "virtio0", null) != null ? [local.virtio_disks["virtio0"]] : []
        content {
          disk {
            format   = virtio0.value.disk.format
            iothread = virtio0.value.disk.iothread
            size     = virtio0.value.disk.size
            storage  = virtio0.value.disk.storage
          }
        }
      }
      dynamic "virtio1" {
        for_each = lookup(local.virtio_disks, "virtio1", null) != null ? [local.virtio_disks["virtio1"]] : []
        content {
          disk {
            format   = virtio1.value.disk.format
            iothread = virtio1.value.disk.iothread
            size     = virtio1.value.disk.size
            storage  = virtio1.value.disk.storage
          }
        }
      }
      dynamic "virtio2" {
        for_each = lookup(local.virtio_disks, "virtio2", null) != null ? [local.virtio_disks["virtio2"]] : []
        content {
          disk {
            format   = virtio2.value.disk.format
            iothread = virtio2.value.disk.iothread
            size     = virtio2.value.disk.size
            storage  = virtio2.value.disk.storage
          }
        }
      }
    }
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
