moved {
  from = azurerm_dev_center_gallery.this
  to   = azapi_resource.this
}

resource "azapi_resource" "this" {
  type                   = "Microsoft.DevCenter/devCenters/galleries@2025-02-01"
  parent_id              = var.dev_center_gallery_dev_center_id
  name                   = var.dev_center_gallery_name
  response_export_values = []
  replace_triggers_refs  = ["properties.galleryResourceId"]

  body = {
    properties = {
      galleryResourceId = var.dev_center_gallery_shared_gallery_id
    }
  }

  dynamic "timeouts" {
    for_each = var.dev_center_gallery_timeouts == null ? [] : [var.dev_center_gallery_timeouts]

    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
    }
  }
}
