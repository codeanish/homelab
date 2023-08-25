resource "proxmox_vm_qemu" "adguard-home" {
    
    # VM General Settings
    target_node = var.proxmox_node_name
    vmid = "101"
    name = "adguard-home"
    desc = "Ubuntu Server installation of adguard home"
    clone = var.ubuntu_base_image_name
    onboot = true 
    agent = 1
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu = "host"    
    memory = 1024

    disk {
        size = "20G"
        type = var.storage_type
        format = var.storage_format
        storage = var.storage_volume_name
    }

    # Networking
    network {
        bridge = var.network_bridge
        model  = var.network_model
    }

    # Cloud init
    os_type = "cloud-init"
    ipconfig0 = "ip=${var.adguard_ip}/24,gw=${var.gateway_ip}"
    ciuser = var.ciuser
}