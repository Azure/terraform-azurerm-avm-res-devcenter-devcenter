resource "azurerm_dev_center_project" "this" {
  dev_center_id              = var.dev_center_project_dev_center_id
  location                   = var.dev_center_project_location
  name                       = var.dev_center_project_name
  resource_group_name        = var.dev_center_project_resource_group_name
  description                = var.dev_center_project_description
  maximum_dev_boxes_per_user = var.dev_center_project_maximum_dev_boxes_per_user
  tags                       = var.dev_center_project_tags

  dynamic "identity" {
    for_each = local.managed_identities.system_assigned_user_assigned

    content {
      type         = identity.value.type
      identity_ids = identity.value.user_assigned_resource_ids
    }
  }
}
