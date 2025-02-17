output "control_plane_nodes_pve01" {
  value = {
    name = proxmox_vm_qemu.talos_control_plane_pve01.*.name,
    mac_address = [for iface in flatten(proxmox_vm_qemu.talos_control_plane_pve01.*.network) : iface.macaddr]
    }
}

output "control_plane_nodes_pve02" {
  value = {
    name = proxmox_vm_qemu.talos_control_plane_pve02.*.name,
    mac_address = [for iface in flatten(proxmox_vm_qemu.talos_control_plane_pve02.*.network) : iface.macaddr]
    }
}

output "worker_nodes_pve01" {
  value = {
    name = proxmox_vm_qemu.talos_worker_pve01.*.name,
    mac_address = [for iface in flatten(proxmox_vm_qemu.talos_worker_pve01.*.network) : iface.macaddr]
    }
}

output "worker_nodes_pve02" {
  value = {
    name = proxmox_vm_qemu.talos_worker_pve02.*.name,
    mac_address = [for iface in flatten(proxmox_vm_qemu.talos_worker_pve02.*.network) : iface.macaddr]
    }
}