
module "qemu_vms" {
  source = "./modules/qemu_vms"

  for_each = local.qemu_vms

  name         = each.value.name
  target_node  = each.value.target_node
  vmid         = each.value.vmid
  vm_state     = each.value.vm_state
  memory       = each.value.memory
  cpu_cores    = each.value.cpu_cores
  disk_storage = each.value.disk_storage
}
