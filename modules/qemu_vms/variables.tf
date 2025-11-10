
variable "agent" {
  description = "Enable QEMU guest agent"
  type        = number
  default     = 1
}

variable "balloon" {
  description = "memory ballooning"
  type        = number
  default     = 0
}

variable "boot" {
  description = "Boot order"
  type        = string
  default     = "order=ide0;virtio0"
}

variable "cpu_cores" {
  description = "Number of CPU cores"
  type        = number
}

variable "cpu_type" {
  description = "CPU type"
  type        = string
  default     = "x86-64-v2-AES"
}

variable "cdrom_iso" {
  description = "ISO image for CD-ROM"
  type        = string
  default     = ""
}

variable "disks" {
  description = "List of disk configurations"
  type = list(object({
    slot     = string
    size     = number
    format   = optional(string, "raw")
    iothread = optional(bool, true)
    storage  = string
  }))
}

variable "memory" {
  description = "Memory in MB"
  type        = number
}

variable "name" {
  description = "VM Name"
  type        = string
}

variable "network_id" {
  description = "Network interface ID"
  type        = number
  default     = 0
}

variable "network_bridge" {
  description = "Network bridge"
  type        = string
  default     = "vmbr0"
}

variable "network_firewall" {
  description = "Enable firewall on network interface"
  type        = bool
  default     = true
}

variable "network_link_down" {
  description = "Set link down on network interface"
  type        = bool
  default     = false
}

variable "network_macaddr" {
  description = "MAC address"
  type        = string
}

variable "network_model" {
  description = "Network model"
  type        = string
  default     = "virtio"
}
variable "scsihw" {
  description = "SCSI hardware type"
  type        = string
  default     = "virtio-scsi-pci"
}

variable "skip_ipv6" {
  description = "Skip IPv6"
  type        = bool
  default     = true
}

variable "target_node" {
  description = "Proxmox node to deploy the VM on"
  type        = string
}

variable "vm_state" {
  description = "State of the VM"
  type        = string
  default     = "stopped"
}

variable "vmid" {
  description = "VM ID"
  type        = number
}
