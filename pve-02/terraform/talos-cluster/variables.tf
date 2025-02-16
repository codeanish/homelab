# PROVIDER VARIABLES
variable "pm_api_url" {
  type = string
}

variable "pm_api_token_id" {
  type = string
}

variable "pm_api_token_secret" {
  type = string
}

# VM VARIABLES
variable "target_node" {
  type = string
}

variable "vm_id" {
  type = number
}

variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "cpu_cores" {
  type    = number
  default = 2
}

variable "memory_in_mb" {
  type    = number
  default = 2048
}

# DISK ISO VARIABLES
variable "iso_file_name" {
  type = string
}

variable "iso_file_storage_pool" {
  type = string
}

# STORAGE VARIABLES
variable "disk_size_in_gb" {
  type = number
}

variable "disk_storage_volume" {
  type = string
}

# NETWORK VARIABLES
variable "network_bridge" {
  type    = string
  default = "vmbr1"
}
