resource "proxmox_vm_qemu" "portainer" {
    
    # VM General Settings
    target_node = "proxmox"
    vmid = "102"
    name = "portainer"
    desc = "Ubuntu Server installation of Portainer Server CE"
    clone = "ubuntu-server-22.04"
    onboot = true 
    agent = 1
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu = "host"    
    memory = 2048

    disk {
        size = "20G"
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
    ipconfig0 = "ip=10.0.20.50/24,gw=10.0.20.1"
    ciuser = "anish"
}