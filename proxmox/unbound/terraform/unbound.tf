resource "proxmox_vm_qemu" "unbound_pve01" {
    target_node = var.pve01_target_node
    vmid = 101
    name = "unbound-1"
    desc = "Ubuntu Server 24.04 - Unbound"
    clone = var.ubuntu_base_image
    onboot = true
    boot= "order=scsi0"
    agent = 1
    full_clone = true
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu_type = "x86-64-v2-AES"    
    memory = 1024

    disks {
        scsi{
            scsi0 {
                disk{
                    storage = var.disk_storage_volume
                    size = "20G"
                    format = "raw"
                    discard = true
                    emulatessd = true
                }   
            }
        }
        ide {
          ide0 {
            cloudinit {
              storage = var.disk_storage_volume
            }
          }
        }
    }

    # Networking
    network {
        id = "0"
        bridge = var.network_bridge
        model  = "virtio"
    }

    # Cloud init
    os_type = "cloud-init"
    ipconfig0 = "ip=${var.pve01_unbound_ip}/24,gw=${var.pve01_gateway_ip}"
    ciuser = var.ciuser
    sshkeys = var.ssh_public_key
}

resource "proxmox_vm_qemu" "unbound_pve02" {
    target_node = var.pve02_target_node
    vmid = 301
    name = "unbound-2"
    desc = "Ubuntu Server 24.04 - Unbound"
    clone = var.ubuntu_base_image
    onboot = true 
    boot= "order=scsi0"
    agent = 1
    full_clone = true
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu_type = "x86-64-v2-AES"    
    memory = 1024

    disks {
        scsi{
            scsi0 {
                disk{
                    storage = var.disk_storage_volume
                    size = "20G"
                    format = "raw"
                    discard = true
                    emulatessd = true
                }   
            }
        }
        ide {
          ide0 {
            cloudinit {
              storage = var.disk_storage_volume
            }
          }
        }
    }

    # Networking
    network {
        id = "0"
        bridge = var.network_bridge
        model  = "virtio"
    }

    # Cloud init
    os_type = "cloud-init"
    ipconfig0 = "ip=${var.pve02_unbound_ip}/24,gw=${var.pve02_gateway_ip}"
    ciuser = var.ciuser
    sshkeys = var.ssh_public_key
}

resource "proxmox_vm_qemu" "unbound_pve03" {
    target_node = var.pve03_target_node
    vmid = 401
    name = "unbound-3"
    desc = "Ubuntu Server 24.04 - Unbound"
    clone = var.ubuntu_base_image
    onboot = true 
    boot= "order=scsi0"
    agent = 1
    full_clone = true
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu_type = "x86-64-v2-AES"    
    memory = 1024

    disks {
        scsi{
            scsi0 {
                disk{
                    storage = var.disk_storage_volume
                    size = "20G"
                    format = "raw"
                    discard = true
                    emulatessd = true
                }   
            }
        }
        ide {
          ide0 {
            cloudinit {
              storage = var.disk_storage_volume
            }
          }
        }
    }

    # Networking
    network {
        id = "0"
        bridge = var.network_bridge
        model  = "virtio"
    }

    # Cloud init
    os_type = "cloud-init"
    ipconfig0 = "ip=${var.pve03_unbound_ip}/24,gw=${var.pve03_gateway_ip}"
    ciuser = var.ciuser
    sshkeys = var.ssh_public_key
}