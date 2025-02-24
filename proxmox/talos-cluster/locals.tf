locals {
  iso_file_location = format("%s:iso/%s", var.iso_file_storage_pool, var.iso_file_name)
  tags              = join(",", var.tags)
}
