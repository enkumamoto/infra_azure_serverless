resource "azurerm_cosmosdb_account" "cosmodb" {
  name                = "cosmodb-${var.environment}"
  resource_group_name = azurerm_resource_group.rg_name.name
  location            = azurerm_resource_group.rg_name.location
  offer_type          = "Standard"
  kind                = "MongoDB"

  capabilities {
    name = "EnableAggregationPipeline"
  }

  capabilities {
    name = "mongoEnableDocLevelTTL"
  }

  capabilities {
    name = "MongoDBv3.4"
  }

  capabilities {
    name = "EnableMongo"
  }

  consistency_policy {
    consistency_level       = "BoundedStaleness"
    max_interval_in_seconds = 300
    max_staleness_prefix    = 100000
  }

  geo_location {
    location          = "westus"
    failover_priority = 1
  }

  geo_location {
    location          = "eastus"
    failover_priority = 0
  }

  tags = {
    environment = var.environment
  }
}
