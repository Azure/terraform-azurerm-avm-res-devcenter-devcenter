
resource "azurerm_dev_center_catalog" "this" {
  dev_center_id       = var.dev_center_catalog_dev_center_id
  name                = var.dev_center_catalog_name
  resource_group_name = var.dev_center_catalog_resource_group_name

  catalog_adogit {
    branch            = var.dev_center_catalog_adogit.branch
    key_vault_key_url = var.dev_center_catalog_adogit.key_vault_key_url
    path              = var.dev_center_catalog_adogit.path
    uri               = var.dev_center_catalog_adogit.uri
  }
  catalog_github {
    branch            = var.dev_center_catalog_github.branch
    key_vault_key_url = var.dev_center_catalog_github.key_vault_key_url
    path              = var.dev_center_catalog_github.path
    uri               = var.dev_center_catalog_github.uri
  }
}
