output "mac_address" {
  value = proxmox_vm_qemu.talos.network[0].macaddr
}
output "node_name" {
  value = proxmox_vm_qemu.talos.name
}
