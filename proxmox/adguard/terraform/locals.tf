locals{
    tags = join(",", var.tags)
    storage_size = "${var.storage_size_in_gb}G"
}