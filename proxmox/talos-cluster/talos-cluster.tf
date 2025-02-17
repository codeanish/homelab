resource "proxmox_vm_qemu" "talos_control_plane" {
  count = var.control_plane_nodes
  # VM General Settings
  target_node = var.target_node
  vmid        = 400 + count.index
  name        = "talos-control-plane-${count.index}"
  desc        = "Talos Control Plane Node ${var.talos_version}"
  onboot      = true
  agent       = 1
  vm_state    = "stopped"

  # VM Specs
  cores    = var.control_plane_cpu_cores
  sockets  = 1
  cpu_type = "x86-64-v2-AES"
  memory   = var.control_plane_memory_in_mb

  # ISO
  disk {
    type = "cdrom"
    slot = "ide2"
    iso  = local.iso_file_location
  }

  # Storage
  disk {
    size    = local.control_plane_disk_file_size
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

resource "proxmox_vm_qemu" "talos_worker" {
  count = var.worker_nodes
  # VM General Settings
  target_node = var.target_node
  vmid        = 410 + count.index
  name        = "talos-worker-${count.index}"
  desc        = "Talos Worker Node ${var.talos_version}"
  onboot      = true
  agent       = 1
  vm_state    = "stopped"

  # VM Specs
  cores    = var.worker_cpu_cores
  sockets  = 1
  cpu_type = "x86-64-v2-AES"
  memory   = var.worker_memory_in_mb

  # ISO
  disk {
    type = "cdrom"
    slot = "ide2"
    iso  = local.iso_file_location
  }

  # Storage
  disk {
    size    = local.worker_disk_file_size
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
