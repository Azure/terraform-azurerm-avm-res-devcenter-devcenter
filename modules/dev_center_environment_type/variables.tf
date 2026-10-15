variable "dev_center_environment_type_dev_center_id" {
  type        = string
  description = "(Required) The ID of the associated Dev Center. Changing this forces a new resource to be created."
  nullable    = false
}

variable "dev_center_environment_type_name" {
  type        = string
  description = "(Required) Specifies the name of this Dev Center Environment Type. Changing this forces a new resource to be created."
  nullable    = false
}

variable "location" {
  type        = string
  description = "The Azure region for this module's resources or telemetry deployment."
  nullable    = false
}

variable "dev_center_environment_type_tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A mapping of tags which should be assigned to the Dev Center Environment Type."
}

variable "dev_center_environment_type_timeouts" {
  type = object({
    create = optional(string)
    delete = optional(string)
    read   = optional(string)
    update = optional(string)
  })
  default     = null
  description = <<-EOT
 - `create` - (Defaults to 30 minutes) Used when creating this Dev Center Environment Type.
 - `delete` - (Defaults to 30 minutes) Used when deleting this Dev Center Environment Type.
 - `read` - (Defaults to 5 minutes) Used when retrieving this Dev Center Environment Type.
 - `update` - (Defaults to 30 minutes) Used when updating this Dev Center Environment Type.
EOT
}

variable "enable_telemetry" {
  type        = bool
  default     = true
  description = <<DESCRIPTION
This variable controls whether or not telemetry is enabled for the module.
For more information see <https://aka.ms/avm/telemetryinfo>.
If it is set to false, then no telemetry will be collected.
DESCRIPTION
  nullable    = false
}
