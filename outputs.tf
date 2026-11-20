output "dev_center_uri" {
  description = "The URI of the Dev Center."
  value       = local.resource_block.dev_center_uri
}

# Module owners should include the full resource via a 'resource' output
# https://azure.github.io/Azure-Verified-Modules/specs/terraform/#id-tffr2---category-outputs---additional-terraform-outputs
output "resource" {
  description = "This is the full output for the resource."
  value       = local.resource_block
}

output "resource_id" {
  description = "value of the resource id"
  value       = azapi_resource.this.id
}

output "system_assigned_mi_principal_id" {
  description = "The principal ID of system assigned managed identity on the Dev Center, when `var.dev_center_identity` is `null` or `var.dev_center_identity.type` is not `SystemAssigned` this output is `null`."
  value       = try(var.dev_center_identity.type == "SystemAssigned", false) ? local.resource_block.system_assigned_managed_identity_principal_id : null
}

output "user_assigned_mi_principal_id" {
  description = "The principal ID of user assigned managed identity on the Dev Center, when `var.dev_center_identity` is `null` or `var.dev_center_identity.type` is not `UserAssigned` this output is `null`."
  value       = try(var.dev_center_identity.type == "UserAssigned", false) ? local.resource_block.user_assigned_managed_identity_principal_id : null
}
