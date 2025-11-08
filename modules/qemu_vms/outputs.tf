
output "target_node" {
  description = "Proxmox node to deploy VM"
  value       = proxmox_vm_qemu.vm.target_node
}

output "vm_id" {
  description = "VM ID"
  value       = proxmox_vm_qemu.vm.vmid
}

output "vm_name" {
  description = "VM name"
  value       = proxmox_vm_qemu.vm.name
}

output "vm_state" {
  description = "Current VM State"
  value       = proxmox_vm_qemu.vm.vm_state
}
