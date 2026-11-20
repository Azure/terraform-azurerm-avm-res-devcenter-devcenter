resource "azapi_resource" "this" {
  type = "Microsoft.DevCenter/devcenters/catalogs@2026-01-01-preview"

  name      = var.dev_center_catalog_name
  parent_id = var.dev_center_catalog_dev_center_id
  body = {
    properties = {
      adoGit = {
        branch           = var.dev_center_catalog_adogit.branch
        path             = var.dev_center_catalog_adogit.path
        secretIdentifier = var.dev_center_catalog_adogit.key_vault_key_url
        uri              = var.dev_center_catalog_adogit.uri
      }
      gitHub = {
        branch           = var.dev_center_catalog_github.branch
        path             = var.dev_center_catalog_github.path
        secretIdentifier = var.dev_center_catalog_github.key_vault_key_url
        uri              = var.dev_center_catalog_github.uri
      }
    }
  }
}

moved {
  from = azurerm_dev_center_catalog.this
  to   = azapi_resource.this
}
