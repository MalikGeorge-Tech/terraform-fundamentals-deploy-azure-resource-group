output "resource_group_id" {
  description = "The full Azure resource ID of the created resource group."
  value       = azurerm_resource_group.rg.id
}

output "resource_group_name" {
  description = "The name of the created resource group."
  value       = azurerm_resource_group.rg.name
}

output "resource_group_location" {
  description = "The Azure region the resource group was created in."
  value       = azurerm_resource_group.rg.location
}