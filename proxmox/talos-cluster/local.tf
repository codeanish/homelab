locals {
  iso_file_location = format("%s:iso/%s", var.iso_file_storage_pool, var.iso_file_name)
  # control_plane_disk_file_size    = format("%gG", var.control_plane_disk_size_in_gb)
  # worker_disk_file_size    = format("%gG", var.worker_disk_size_in_gb)
}
