resource "proxmox_vm_qemu" "plex"{
    target_node = var.proxmox_node_name
    vmid = 106
    name = "plex"
    desc = "Ubuntu Server installation of plex"
    clone = var.ubuntu_base_image_name
    onboot = true 
    agent = 1
    full_clone = true
    cores = 4
    sockets = 1
    cpu = "host"    
    memory = 6144
    disk {
        size = "32G"
        type = var.storage_type
        format = var.storage_format
        storage = var.storage_volume_name
    }
    network {
        bridge = var.network_bridge
        model  = var.network_model
    }
    os_type = "cloud-init"
    ipconfig0 = "ip=${var.plex_ip}/24,gw=${var.gateway_ip}"
    ciuser = var.ciuser
}