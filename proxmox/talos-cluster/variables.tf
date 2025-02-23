# PROVIDER VARIABLES
variable "api_url" {
  type = string
}

variable "token_id" {
  type = string
}

variable "token_secret" {
  type = string
}

# CONTROL PLANE CONFIGURATION

variable "control_plane_configuration" {
  type = map(object({
    node     = string
    vmid     = number
    name     = string
    cpu_cores= number
    memory_in_mb = number
    disk_size_in_gb = number
  }))
}

# variable "control_plane_cpu_cores" {
#   type    = number
#   default = 2
# }

# variable "control_plane_memory_in_mb" {
#   type    = number
#   default = 2048
# }

# variable "control_plane_disk_size_in_gb" {
#   type = number
# }

# WORKER CONFIGURATION

variable "worker_configuration" {
  type = map(object({
    node     = string
    vmid     = number
    name     = string
    cpu_cores= number
    memory_in_mb = number
    disk_size_in_gb = number
  }))
}

# variable "worker_cpu_cores" {
#   type    = number
#   default = 2
# }

# variable "worker_memory_in_mb" {
#   type    = number
#   default = 2048
# }

# variable "worker_disk_size_in_gb" {
#   type = number
# }

# VM VARIABLES
variable "talos_version" {
  type = string
}

variable "iso_file_name" {
  type = string
}

variable "iso_file_storage_pool" {
  type = string
}

variable "disk_storage_volume" {
  type = string
}

variable "network_bridge" {
  type    = string
  default = "vmbr1"
}

variable "vm_state" {
  type    = string
  default = "stopped"
}
