moved {
  from = azurerm_dev_center_dev_box_definition.this
  to   = azapi_resource.this
}

resource "azapi_resource" "this" {
  type                   = "Microsoft.DevCenter/devCenters/devBoxDefinitions@2025-02-01"
  parent_id              = var.dev_center_dev_box_definition_dev_center_id
  location               = var.dev_center_dev_box_definition_location
  name                   = var.dev_center_dev_box_definition_name
  tags                   = var.dev_center_dev_box_definition_tags
  response_export_values = []

  body = {
    properties = {
      imageReference = {
        id = var.dev_center_dev_box_definition_image_reference_id
      }
      sku = {
        name = var.dev_center_dev_box_definition_sku_name
      }
    }
  }

  dynamic "timeouts" {
    for_each = var.dev_center_dev_box_definition_timeouts == null ? [] : [var.dev_center_dev_box_definition_timeouts]

    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}
