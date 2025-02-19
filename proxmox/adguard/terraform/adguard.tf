resource "proxmox_vm_qemu" "adguard_pve01" {
    target_node = var.pve01_target_node
    vmid = 102
    name = "adguard"
    desc = "Ubuntu Server 24.04 - Adguard"
    clone = var.ubuntu_base_image
    onboot = true 
    agent = 1
    full_clone = true
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu_type = "x86-64-v2-AES"    
    memory = 2048

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
    ipconfig0 = "ip=${var.pve01_adguard_ip}/24,gw=${var.pve01_gateway_ip}"
    ciuser = var.ciuser
    sshkeys = var.ssh_public_key
}

resource "proxmox_vm_qemu" "adguard_pve02" {
    target_node = var.pve02_target_node
    vmid = 302
    name = "adguard-2"
    desc = "Ubuntu Server 24.04 - Adguard"
    clone = var.ubuntu_base_image
    onboot = true 
    agent = 1
    full_clone = true
    
    # VM Specs
    cores = 2
    sockets = 1
    cpu_type = "x86-64-v2-AES"    
    memory = 2048

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
    ipconfig0 = "ip=${var.pve02_adguard_ip}/24,gw=${var.pve02_gateway_ip}"
    ciuser = var.ciuser
    sshkeys = var.ssh_public_key
}