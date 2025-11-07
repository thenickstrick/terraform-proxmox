
locals {
  qemu_vm_files = fileset("${path.module}/configs/qemu_vms", "*.json")
  qemu_vms = {
    for f in local.qemu_vm_files :
    trimsuffix(f, ".json") => jsondecode(file("${path.module}/configs/qemu_vms/${f}"))
  }
}

module "qemu_vms" {
  for_each = local.qemu_vms
  source   = "./modules/proxmox-vm"

  name         = each.key
  target_node  = each.value.target_node
  vmid         = each.value.vmid
  vm_state     = each.value.vm_state
  memory       = each.value.memory
  cpu_cores    = each.value.cpu_cores
  disk_storage = each.value.disk_storage
}
