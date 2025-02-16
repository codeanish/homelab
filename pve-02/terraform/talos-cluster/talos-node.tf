resource "proxmox_vm_qemu" "talos" {

  # VM General Settings
  target_node = var.target_node
  vmid        = var.vm_id
  name        = var.name
  desc        = var.description
  onboot      = true
  agent       = 1
  vm_state    = "stopped"

  # VM Specs
  cores    = var.cpu_cores
  sockets  = 1
  cpu_type = "x86-64-v2-AES"
  memory   = var.memory_in_mb

  # ISO
  disk {
    type = "cdrom"
    slot = "ide2"
    iso  = local.iso_file_location
  }

  # Storage
  disk {
    size    = local.disk_file_size
    type    = "disk"
    format  = "raw"
    storage = var.disk_storage_volume
    slot    = "sata0"
  }

  # Networking
  network {
    id     = "0"
    bridge = var.network_bridge
    model  = "virtio"
  }
}
