resource "azurerm_resource_group" "rg_name" {
  name     = "RG-${var.rg_name}"
  location = var.location

  tags = {
    name = var.environment
  }
}

output "rg_name" {
  value = azurerm_resource_group.rg_name.name
}
