# PROVIDER VARIABLES
variable "pve_api_url" {
  type = string
}

variable "pve_api_token_id" {
  type = string
}

variable "pve_api_token_secret" {
  type = string
}

variable "configuration" {
  type = map(object({
    node = string
    ip = string
    gateway = string
    vmid = number
    name = string
  }))
}

variable "ubuntu_base_image" {
  type = string
}

variable "disk_storage_volume" {
  type = string
}

variable "network_bridge" {
  type = string
}

variable "ciuser" {
  type = string
}

variable "ssh_public_key" {
  type = string
}