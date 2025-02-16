locals {
  iso_file_location = format("%s:iso/%s", var.iso_file_storage_pool, var.iso_file_name)
  disk_file_size    = format("%gG", var.disk_size_in_gb)
}
