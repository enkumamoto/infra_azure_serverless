resource "azurerm_network_security_group" "Infra_NSG" {
  name                = lower("${var.rg_name}-nsg")
  location            = azurerm_resource_group.rg_name.location
  resource_group_name = azurerm_resource_group.rg_name.name

  tags = {
    Environment = var.environment
  }
}
