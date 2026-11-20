moved {
  from = azurerm_dev_center_environment_type.this
  to   = azapi_resource.this
}

resource "azapi_resource" "this" {
  type                   = "Microsoft.DevCenter/devCenters/environmentTypes@2025-02-01"
  parent_id              = var.dev_center_environment_type_dev_center_id
  name                   = var.dev_center_environment_type_name
  tags                   = var.dev_center_environment_type_tags
  body                   = {}
  response_export_values = []

  dynamic "timeouts" {
    for_each = var.dev_center_environment_type_timeouts == null ? [] : [var.dev_center_environment_type_timeouts]

    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      read   = timeouts.value.read
      update = timeouts.value.update
    }
  }
}
