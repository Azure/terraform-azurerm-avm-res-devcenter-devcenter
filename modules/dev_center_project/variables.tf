variable "dev_center_project_dev_center_id" {
  type        = string
  description = "(Required) Specifies the ID of the Dev Center within which this Dev Center Project should exist. Changing this forces a new Dev Center Project to be created."
  nullable    = false
}

variable "dev_center_project_location" {
  type        = string
  description = "(Required) Specifies the Azure Region where this Dev Center Project should exist. Changing this forces a new Dev Center Project to be created."
  nullable    = false
}

variable "dev_center_project_name" {
  type        = string
  description = "(Required) Specifies the name of the Dev Center Project. Changing this forces a new Dev Center Project to be created."
  nullable    = false
}

variable "dev_center_project_resource_group_name" {
  type        = string
  description = "(Required) Specifies the name of the Resource Group within which this Dev Center Project should exist. Changing this forces a new Dev Center Project to be created."
  nullable    = false
}

variable "dev_center_project_description" {
  type        = string
  default     = null
  description = "(Optional) Specifies the description of the Dev Center Project. Changing this forces a new Dev Center Project to be created."
}

variable "dev_center_project_maximum_dev_boxes_per_user" {
  type        = number
  default     = 1
  description = "(Optional) Specifies the maximum number of Dev Boxes that can be created per user in this Dev Center Project. Defaults to 1 if not specified."

  validation {
    condition     = var.dev_center_project_maximum_dev_boxes_per_user >= 1
    error_message = "The maximum number of Dev Boxes per user must be at least 1."
  }
}

variable "dev_center_project_tags" {
  type        = map(string)
  default     = null
  description = "(Optional) A mapping of tags which should be assigned to the Dev Center Project. Changing this forces a new Dev Center Project to be created."
}

# tflint-ignore: terraform_unused_declarations
variable "managed_identities" {
  type = object({
    system_assigned            = optional(bool, false)
    user_assigned_resource_ids = optional(set(string), [])
  })
  default     = {}
  description = <<DESCRIPTION
Controls the Managed Identity configuration on this resource. The following properties can be specified:

- `system_assigned` - (Optional) Specifies if the System Assigned Managed Identity should be enabled.
- `user_assigned_resource_ids` - (Optional) Specifies a list of User Assigned Managed Identity resource IDs to be assigned to this resource.
DESCRIPTION
  nullable    = false
}
