resource "azurerm_storage_account" "project_storage_account" {
  name                     = lower("${var.storacc_name}")
  resource_group_name      = azurerm_resource_group.rg_name.name
  location                 = azurerm_resource_group.rg_name.location
  account_tier             = var.sku_tier
  account_replication_type = var.account_replication_type

  tags = {
    Environment = var.environment
  }
}

resource "azurerm_storage_container" "project_container" {
  name                  = lower("${var.storacc_name}-content")
  storage_account_name  = azurerm_storage_account.project_storage_account.name
  container_access_type = "private"
}
