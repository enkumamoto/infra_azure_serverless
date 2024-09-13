resource "azurerm_service_plan" "app_plan" {
  name                = var.service_plan
  location            = var.location
  resource_group_name = azurerm_resource_group.rg_name.name
  os_type             = var.os_type
  sku_name            = var.service_plan_sku_name

  tags = {
    environment = var.environment
  }

  depends_on = [azurerm_resource_group.rg_name]
}
