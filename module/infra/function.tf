resource "azurerm_linux_function_app" "function_app" {
  name                = lower("${var.rg_name}functionapp${var.environment}")
  resource_group_name = azurerm_resource_group.rg_name.name
  location            = azurerm_resource_group.rg_name.location

  storage_account_name       = azurerm_storage_account.project_storage_account.name
  storage_account_access_key = azurerm_storage_account.project_storage_account.primary_access_key
  service_plan_id            = azurerm_service_plan.app_plan.id

  depends_on = [azurerm_storage_account.project_storage_account, azurerm_service_plan.app_plan]

  site_config {}
}

