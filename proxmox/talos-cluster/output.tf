output "control_plane_nodes" {
  value = [
    for node in proxmox_vm_qemu.talos_control_plane : { node : node.name, mac_addr : node.network[0].macaddr }
  ]
}

output "worker_nodes" {
  value = [
    for node in proxmox_vm_qemu.talos_worker : { node : node.name, mac_addr : node.network[0].macaddr }
  ]
}
