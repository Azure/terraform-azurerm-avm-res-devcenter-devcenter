output "dev_center_uri" {
  description = "The URI of the Dev Center."
  value       = azurerm_dev_center.this.dev_center_uri
}

# Module owners should include the full resource via a 'resource' output
# https://azure.github.io/Azure-Verified-Modules/specs/terraform/#id-tffr2---category-outputs---additional-terraform-outputs
output "resource" {
  description = "This is the full output for the resource."
  value       = azurerm_dev_center.this # TODO: Replace this dummy resource azurerm_resource_group.TODO with your module resource
}

output "resource_id" {
  description = "value of the resource id"
  value       = azurerm_dev_center.this.id
}
