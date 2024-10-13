resource "azurerm_dev_center_environment_type" "this" {
  dev_center_id = var.dev_center_environment_type_dev_center_id
  name          = var.dev_center_environment_type_name
  tags          = var.dev_center_environment_type_tags

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

