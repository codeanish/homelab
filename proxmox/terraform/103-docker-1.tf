resource "proxmox_vm_qemu" "docker-1" {
    
    # VM General Settings
    target_node = "proxmox"
    vmid = "103"
    name = "docker-1"
    desc = "Ubuntu Server installation of Docker host"
    clone = "ubuntu-server-22.04"
    onboot = true 
    agent = 1
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu = "host"    
    memory = 4096

    disk {
        size = "30G"
        type = "scsi"
        format = "raw"
        storage = "local-lvm-nvme"
    }

    # Networking
    network {
        bridge = "vmbr1"
        model  = "virtio"
    }

    # Cloud init
    os_type = "cloud-init"
    ipconfig0 = "ip=10.0.20.51/24,gw=10.0.20.1"
    ciuser = "anish"
}