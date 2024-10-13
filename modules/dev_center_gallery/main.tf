resource "azurerm_dev_center_gallery" "this" {
  dev_center_id     = var.dev_center_gallery_dev_center_id
  name              = var.dev_center_gallery_name
  shared_gallery_id = var.dev_center_gallery_shared_gallery_id

  dynamic "timeouts" {
    for_each = var.dev_center_gallery_timeouts == null ? [] : [var.dev_center_gallery_timeouts]

    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
    }
  }
}

