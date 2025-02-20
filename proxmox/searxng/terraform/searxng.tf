resource "proxmox_vm_qemu" "searxng" {
    for_each = var.configuration
    target_node = each.value.node
    vmid = each.value.vmid
    name = each.value.name
    desc = "Ubuntu Server 24.04 - SearXNG"
    clone = var.ubuntu_base_image
    onboot = true
    boot= "order=scsi0"
    agent = 1
    full_clone = true
    
    # VM Specs
    cores = 1
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
    ipconfig0 = "ip=${each.value.ip}/24,gw=${each.value.gateway}"
    ciuser = var.ciuser
    sshkeys = var.ssh_public_key
}
