variable "dev_center_gallery_dev_center_id" {
  type        = string
  description = "(Required) Specifies the ID of the Dev Center within which this Dev Center Gallery should exist. Changing this forces a new Dev Center Gallery to be created."
  nullable    = false
}

variable "dev_center_gallery_name" {
  type        = string
  description = "(Required) Specifies the name of this Dev Center Gallery. Changing this forces a new Dev Center Gallery to be created."
  nullable    = false
}

variable "dev_center_gallery_shared_gallery_id" {
  type        = string
  description = "(Required) The ID of the Shared Gallery which should be connected to the Dev Center Gallery. Changing this forces a new Dev Center Gallery to be created."
  nullable    = false
}

variable "dev_center_gallery_timeouts" {
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
  })
  default     = null
  description = <<-EOT
 - `create` - (Defaults to 30 minutes) Used when creating this Dev Center Gallery.
 - `delete` - (Defaults to 30 minutes) Used when deleting this Dev Center Gallery.
 - `read` - (Defaults to 5 minutes) Used when retrieving this Dev Center Gallery.
EOT
}
