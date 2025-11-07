
locals {
  qemu_vm_files = fileset("${path.module}/configs/qemu_vms", "*.json")

  qemu_vms = {
    for qemu_vm_config in local.qemu_vm_files :
    replace(qemu_vm_config, ".json", "") => jsondecode(file("${path.module}/configs/qemu_vms/${qemu_vm_config}"))
  }
}
