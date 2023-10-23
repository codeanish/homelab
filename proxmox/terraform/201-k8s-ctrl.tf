resource "proxmox_vm_qemu" "k8s-ctrl" {
    
    # VM General Settings
    target_node = var.proxmox_node_name
    vmid = 201
    name = "k8s-ctrl"
    desc = "Kubernetes controller"
    clone = var.ubuntu_base_image_name
    onboot = true 
    agent = 1
    full_clone = true
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu = "host"    
    memory = 2048

    disk {
        size = "32G"
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
    ipconfig0 = "ip=${var.k8s_ctrl_ip}/24,gw=${var.gateway_ip}"
    ciuser = var.ciuser
}