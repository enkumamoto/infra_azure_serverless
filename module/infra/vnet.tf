resource "azurerm_virtual_network" "Project_VNet" {
  name                = "${var.rg_name}-VNet"
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name
  address_space       = ["10.0.0.0/16"]

  tags = {
    environment = var.environment
  }

  depends_on = [azurerm_resource_group.rg_name]
}
