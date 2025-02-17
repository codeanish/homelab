output "control_plane_nodes" {
  value = {
    name = proxmox_vm_qemu.talos_control_plane.*.name,
    mac_address = [for iface in flatten(proxmox_vm_qemu.talos_control_plane.*.network) : iface.macaddr]
    }
}

output "worker_nodes" {
  value = {
    name = proxmox_vm_qemu.talos_worker.*.name,
    mac_address = [for iface in flatten(proxmox_vm_qemu.talos_worker.*.network) : iface.macaddr]
    }
}