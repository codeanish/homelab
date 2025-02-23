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

# VM CONFIGURATION

variable "configuration" {
  type = map(object({
    node = string
    ip = string
    gateway = string
    vmid = number
    name = string
  }))
}

variable "cores" {
  type = number
  default = 1
}

variable memory {
  type = number
  default = 1024
  description = "Memory in MB"
}

variable storage_size_in_gb {
  type = number
  default = 20
  description = "Storage size in GB, minimum 20GB"
}

variable tags {
  type = list(string)
  default = []
}

variable "description" {
  type = string
}

variable "base_image" {
  type = string
}

variable "disk_storage_volume" {
  type = string
}

variable "network_bridge" {
  type = string
}

# CLOUD INIT

variable "ciuser" {
  type = string
}

variable "ssh_public_key" {
  type = string
}
