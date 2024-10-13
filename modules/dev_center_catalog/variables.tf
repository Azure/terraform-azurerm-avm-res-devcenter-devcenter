variable "dev_center_catalog_dev_center_id" {
  type        = string
  description = "(Required) Specifies the Dev Center ID. Changing this forces a new resource to be created."
  nullable    = false
}

variable "dev_center_catalog_name" {
  type        = string
  description = "(Required) Specifies the name of the Dev Center Catalog. Changing this forces a new resource to be created."
  nullable    = false
}

variable "dev_center_catalog_resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the resource group in which the Dev Center Catalog should be created."
  nullable    = false
}

variable "dev_center_catalog_adogit" {
  type = object({
    branch            = string
    path              = string
    key_vault_key_url = string
    uri               = string
  })
  default     = null
  description = <<DESCRIPTION
A map describing the dev center catalog Azure DevOps Git repository.
- `branch` - (Required) The Git branch of the Dev Center Catalog.
- `path` - (Required) The folder where the catalog items can be found inside the repository.
- `key_vault_key_url` - (Required) A reference to the Key Vault secret containing a security token to authenticate to a Git repository.
- `uri` - (Required) The Git URI of the Dev Center Catalog.
  DESCRIPTION
}

variable "dev_center_catalog_github" {
  type = object({
    branch            = string
    path              = string
    key_vault_key_url = string
    uri               = string
  })
  default     = null
  description = <<DESCRIPTION
A map describing the dev center catalog GitHub repository.
- `branch` - (Required) The Git branch of the Dev Center Catalog.
- `path` - (Required) The folder where the catalog items can be found inside the repository..
- `key_vault_key_url` - (Required) A reference to the Key Vault secret containing a security token to authenticate to a Git repository.
- `uri` - (Required) The Git URI of the Dev Center Catalog.
  DESCRIPTION
}
