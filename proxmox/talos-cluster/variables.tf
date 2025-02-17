# PROVIDER VARIABLES
variable "pve01_api_url" {
  type = string
}

variable "pve01_api_token_id" {
  type = string
}

variable "pve01_api_token_secret" {
  type = string
}

variable "pve02_api_url" {
  type = string
}

variable "pve02_api_token_id" {
  type = string
}

variable "pve02_api_token_secret" {
  type = string
}

variable "pve01_target_node" {
  type = string
}

variable "pve02_target_node" {
  type = string
}

# VM VARIABLES
variable "talos_version" {
  type = string
}

variable "control_plane_nodes" {
  type    = number
  default = 1
}

variable "control_plane_cpu_cores" {
  type    = number
  default = 2
}

variable "worker_cpu_cores" {
  type    = number
  default = 2
}

variable "control_plane_memory_in_mb" {
  type    = number
  default = 2048
}

variable "worker_nodes" {
  type    = number
  default = 2
}

variable "worker_memory_in_mb" {
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
variable "control_plane_disk_size_in_gb" {
  type = number
}

variable "worker_disk_size_in_gb" {
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

variable "vm_state" {
  type    = string
  default = "stopped"
}
