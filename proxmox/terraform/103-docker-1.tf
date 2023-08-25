resource "proxmox_vm_qemu" "docker-1" {
    
    # VM General Settings
    target_node = var.proxmox_node_name
    vmid = "103"
    name = "docker-1"
    desc = "Ubuntu Server installation of Docker host"
    clone = var.ubuntu_base_image_name
    onboot = true 
    agent = 1
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu = "host"    
    memory = 4096

    disk {
        size = "30G"
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
    ipconfig0 = "ip=${var.docker_1_ip}/24,gw=${var.gateway_ip}"
    ciuser = var.ciuser
    # Not on all VMs
    nameserver = var.dns_server
}