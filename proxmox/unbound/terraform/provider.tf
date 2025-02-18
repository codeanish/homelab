terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "3.0.1-rc6"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.pve01_api_url
  pm_api_token_id     = var.pve01_api_token_id
  pm_api_token_secret = var.pve01_api_token_secret
  pm_tls_insecure     = true
  alias               = "pve01"
}

provider "proxmox" {
  pm_api_url          = var.pve02_api_url
  pm_api_token_id     = var.pve02_api_token_id
  pm_api_token_secret = var.pve02_api_token_secret
  pm_tls_insecure     = true
  alias               = "pve02"
}
