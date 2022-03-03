output "rg_name" {
  value = azurerm_resource_group.this.name
}

output "vnet_name" {
  value = azurerm_virtual_network.this.name
}

output "vnet_id" {
  value = azurerm_virtual_network.this.id
}