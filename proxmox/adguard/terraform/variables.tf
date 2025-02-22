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

variable "pve01_adguard_ip" {
  type = string
}

variable "pve01_gateway_ip" {
  type = string
}

variable "pve02_gateway_ip" {
  type = string
}

variable "pve02_adguard_ip" {
  type = string
}

variable "pve03_adguard_ip" {
  type = string
}

variable "pve03_gateway_ip" {
  type = string
}

variable "pve01_target_node" {
  type = string
}

variable "pve02_target_node" {
  type = string
}

variable "pve03_target_node" {
  type = string
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