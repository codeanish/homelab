resource "proxmox_vm_qemu" "adguard-home" {
    
    # VM General Settings
    target_node = "proxmox"
    vmid = "101"
    name = "adguard-home"
    desc = "Ubuntu Server installation of adguard home"
    clone = "ubuntu-server-22.04"
    onboot = true 
    agent = 1
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu = "host"    
    memory = 1024

    # Networking
    network {
        bridge = "vmbr1"
        model  = "virtio"
    }

    # Cloud init
    os_type = "cloud-init"
    ipconfig0 = "ip=10.0.20.88/24,gw=10.0.20.1"
    ciuser = "anish"
}