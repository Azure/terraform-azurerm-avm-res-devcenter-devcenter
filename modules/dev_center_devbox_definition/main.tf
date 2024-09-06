
resource "azurerm_dev_center_dev_box_definition" "this" {
  dev_center_id      = var.dev_center_dev_box_definition_dev_center_id
  image_reference_id = var.dev_center_dev_box_definition_image_reference_id
  location           = var.dev_center_dev_box_definition_location
  name               = var.dev_center_dev_box_definition_name
  sku_name           = var.dev_center_dev_box_definition_sku_name
  tags               = var.dev_center_dev_box_definition_tags

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

