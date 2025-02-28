resource "proxmox_vm_qemu" "talos_control_plane" {
  for_each = var.control_plane_configuration
  # VM General Settings
  target_node = each.value.node
  vmid        = each.value.vmid
  name        = each.value.name
  desc        = "Talos Control Plane Node ${var.talos_version}"
  onboot      = true
  agent       = 1
  vm_state    = var.vm_state
  tags        = local.tags

  # VM Specs
  cores    = each.value.cpu_cores
  sockets  = 1
  cpu_type = "x86-64-v2-AES"
  memory   = each.value.memory_in_mb

  # ISO
  disk {
    type = "cdrom"
    slot = "ide2"
    iso  = local.iso_file_location
  }

  # Storage
  disk {
    size    = "${each.value.disk_size_in_gb}G"
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
  for_each = var.worker_configuration
  # VM General Settings
  target_node = each.value.node
  vmid        = each.value.vmid
  name        = each.value.name
  desc        = "Talos Worker Node ${var.talos_version}"
  onboot      = true
  agent       = 1
  vm_state    = var.vm_state
  tags        = local.tags

  # VM Specs
  cores    = each.value.cpu_cores
  sockets  = 1
  cpu_type = "x86-64-v2-AES"
  memory   = each.value.memory_in_mb

  # ISO
  disk {
    type = "cdrom"
    slot = "ide2"
    iso  = local.iso_file_location
  }

  # Storage
  disk {
    size    = "${each.value.disk_size_in_gb}G"
    type    = "disk"
    format  = "raw"
    storage = var.disk_storage_volume
    slot    = "sata0"
  }

  # CEPH Rook Cluster Storage
  disk {
    size   = "10G"
    type    = "disk"
    format  = "raw"
    storage = var.disk_storage_volume
    slot    = "sata1"
  }

  # Networking
  network {
    id     = "0"
    bridge = var.network_bridge
    model  = "virtio"
  }
}
