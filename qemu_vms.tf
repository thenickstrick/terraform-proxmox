
module "qemu_vms" {
  source = "./modules/qemu_vms"

  for_each = local.qemu_vms

  cpu_cores       = each.value.cpu_cores
  disk_size = each.value.disk_size
  disk_storage    = each.value.disk_storage
  memory          = each.value.memory
  name            = each.value.name
  network_macaddr = each.value.network_macaddr
  target_node     = each.value.target_node
  vm_state        = each.value.vm_state
  vmid            = each.value.vmid
}
