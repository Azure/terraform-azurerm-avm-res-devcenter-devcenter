output "resource" {
  description = "The Dev Center Project resource."
  value       = azurerm_dev_center_project.this
}

output "resource_id" {
  description = "The ID of the Dev Center Project."
  value       = azurerm_dev_center_project.this.id
}
