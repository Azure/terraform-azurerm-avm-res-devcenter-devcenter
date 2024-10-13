variable "dev_center_dev_box_definition_dev_center_id" {
  type        = string
  description = "(Required) The ID of the associated Dev Center. Changing this forces a new resource to be created."
  nullable    = false
}

variable "dev_center_dev_box_definition_image_reference_id" {
  type        = string
  description = "(Required) The ID of the image for the Dev Center Dev Box Definition."
  nullable    = false
}

variable "dev_center_dev_box_definition_location" {
  type        = string
  description = "(Required) The Azure Region where the Dev Center Dev Box Definition should exist. Changing this forces a new resource to be created."
  nullable    = false
}

variable "dev_center_dev_box_definition_name" {
  type        = string
  description = "(Required) Specifies the name of this Dev Center Dev Box Definition. Changing this forces a new resource to be created."
  nullable    = false
}

variable "dev_center_dev_box_definition_sku_name" {
  type        = string
  description = "(Required) The name of the SKU for the Dev Center Dev Box Definition."
  nullable    = false
}

variable "dev_center_dev_box_definition_tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A mapping of tags which should be assigned to the Dev Center Dev Box Definition."
}

variable "dev_center_dev_box_definition_timeouts" {
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default     = null
  description = <<-EOT
 - `create` - (Defaults to 30 minutes) Used when creating this Dev Center Dev Box Definition.
 - `delete` - (Defaults to 30 minutes) Used when deleting this Dev Center Dev Box Definition.
 - `read` - (Defaults to 5 minutes) Used when retrieving this Dev Center Dev Box Definition.
 - `update` - (Defaults to 30 minutes) Used when updating this Dev Center Dev Box Definition.
EOT
}
