resource "azurerm_subnet" "public-subnet" {
  name                 = "${var.rg_name}-public-subnet"
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.Project_VNet.name
  address_prefixes     = ["10.0.1.0/24"]

  depends_on = [azurerm_virtual_network.Project_VNet]
}

resource "azurerm_subnet" "private-app-subnet" {
  name                 = "${var.rg_name}-private-subnet"
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.Project_VNet.name
  address_prefixes     = ["10.0.2.0/24"]

  depends_on = [azurerm_virtual_network.Project_VNet]
}

resource "azurerm_subnet" "private-database-subnet" {
  name                 = "${var.rg_name}-database-subnet"
  resource_group_name  = azurerm_resource_group.rg_name.name
  virtual_network_name = azurerm_virtual_network.Project_VNet.name
  address_prefixes     = ["10.0.3.0/24"]

  depends_on = [azurerm_virtual_network.Project_VNet]
}
