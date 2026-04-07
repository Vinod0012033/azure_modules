output "id" {
  value       = azurerm_resource_group.resource_group.id
  description = "(string) The ID of the resource group."
}

output "name" {
  value       = azurerm_resource_group.resource_group.name
  description = "(string) The name of the resource group."
}

output "location" {
  value       = azurerm_resource_group.resource_group.location
  description = "(string) The location of the resource group."
}
