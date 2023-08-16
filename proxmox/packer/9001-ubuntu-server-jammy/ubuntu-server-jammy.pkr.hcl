packer {
  required_plugins {
    proxmox = {
      version = ">= 1.1.2"
      source  = "github.com/hashicorp/proxmox"
    }
  }
}

variable "proxmox_api_url" {
    type = string
}

variable "proxmox_api_token_id" {
    type = string
    sensitive = true
}

variable "proxmox_api_token_secret" {
    type = string
    sensitive = true
}

source "proxmox" "ubuntu-server-jammy" {
    proxmox_url = "${var.proxmox_api_url}"
    username = "${var.proxmox_api_token_id}"
    token = "${var.proxmox_api_token_secret}"
    insecure_skip_tls_verify = true

    node = "proxmox"
    vm_id = "9001"
    vm_name = "ubuntu-server-jammy"
    template_description = "Ubuntu Server Jammy"

    iso_file = "local:iso/ubuntu-22.04.3-live-server-amd64.iso"
    iso_storage_pool = "local"
    unmount_iso = true

    qemu_agent = true

    scsi_controller = "virtio-scsi-single"

    disks {
        disk_size = "20G"
        format = "raw"
        storage_pool = "local-lvm-nvme"
        storage_pool_type = "lvm"
        type = "scsi"
    }

    cores = "1"

    memory = "2048"

    network_adapters {
        model = "virtio"
        bridge = "vmbr1"
        firewall = "false"
    }

    cloud_init = true
    cloud_init_storage_pool = "local-lvm-nvme"

     # PACKER Boot Commands
    boot_command = [
        "<esc><wait>",
        "e<wait>",
        "<down><down><down><end>",
        "<bs><bs><bs><bs><wait>",
        "autoinstall ds=nocloud-net\\;s=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ ---<wait>",
        "<f10><wait>"
    ]
    boot = "c"
    boot_wait = "5s"

    http_directory = "http"
    ssh_username = "anish"
    ssh_private_key_file = "~/.ssh/id_ed25519"
    ssh_timeout = "20m"
}

# Build Definition to create the VM Template
build {

    name = "ubuntu-server-jammy"
    sources = ["source.proxmox.ubuntu-server-jammy"]

    # Provisioning the VM Template for Cloud-Init Integration in Proxmox #1
    provisioner "shell" {
        inline = [
            "while [ ! -f /var/lib/cloud/instance/boot-finished ]; do echo 'Waiting for cloud-init...'; sleep 1; done",
            "sudo rm /etc/ssh/ssh_host_*",
            "sudo truncate -s 0 /etc/machine-id",
            "sudo apt -y autoremove --purge",
            "sudo apt -y clean",
            "sudo apt -y autoclean",
            "sudo cloud-init clean",
            "sudo rm -f /etc/cloud/cloud.cfg.d/subiquity-disable-cloudinit-networking.cfg",
            "sudo rm -f /etc/netplan/00-installer-config.yaml",
            "sudo sync"
        ]
    }

    provisioner "file" {
        source = "files/99-pve.cfg"
        destination = "/tmp/99-pve.cfg"
    }

    provisioner "shell" {
        inline = [ "sudo cp /tmp/99-pve.cfg /etc/cloud/cloud.cfg.d/99-pve.cfg" ]
    }
}