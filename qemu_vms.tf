
module "qemu_vms" {
  source = "./modules/qemu_vms"

  for_each = local.qemu_vms

  cdrom_iso       = lookup(each.value, "cdrom_iso", "")
  cpu_cores       = each.value.cpu_cores
  disks           = each.value.disks
  memory          = each.value.memory
  name            = each.value.name
  network_macaddr = lookup(each.value, "network_macaddr", "")
  target_node     = each.value.target_node
  vm_state        = each.value.vm_state
  vmid            = each.value.vmid
}
