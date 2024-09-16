resource "azurerm_cosmosdb_account" "CosmosDb" {
  location            = var.location
  name                = var.name
  offer_type          = var.offer_type
  resource_group_name = var.resource_group_name
  tags = {
    tagName = var.tags["tagName"]
  }
  consistency_policy {
    consistency_level = var.consistency_level
  }
  geo_location {
    failover_priority = var.failover_priority
    location          = var.location
  }
  identity {
    type = var.identity_type
  }
}



resource "azurerm_cosmosdb_sql_database" "CosmosSQLDB" {
  account_name        = var.account_name
  name                = var.database_name
  resource_group_name = var.resource_group_name
  autoscale_settings {
  }
  depends_on = [
    azurerm_cosmosdb_account.CosmosDb,
  ]
}


resource "azurerm_cosmosdb_sql_container" "CosmosContainer" {
  account_name        = var.account_name
  database_name       = var.database_name
  name                = var.container_name
  partition_key_paths  = [var.partition_key_path]
  resource_group_name = var.resource_group_name
  autoscale_settings {
  }
  depends_on = [
    azurerm_cosmosdb_sql_database.CosmosSQLDB,
  ]
}



resource "azurerm_cosmosdb_sql_container" "res-12" {
  account_name        = var.account_name
  database_name       =  var.database_name
  name                = var.container_name2
  partition_key_paths  = [var.partition_key_path]
  resource_group_name = var.resource_group_name
  autoscale_settings {
  }
  depends_on = [
    azurerm_cosmosdb_sql_database.CosmosSQLDB,
  ]
}

# resource "azurerm_cosmosdb_sql_role_assignment" "res-15" {
#   account_name        = "kmblkcosmostest"
#   principal_id        = data.azurerm_client_config.current.object_id
#   resource_group_name = "blktest"
#   role_definition_id  = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.DocumentDB/databaseAccounts/kmblkcosmostest/sqlRoleDefinitions/00000000-0000-0000-0000-000000000002"
#   scope               = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.DocumentDB/databaseAccounts/kmblkcosmostest"
#   depends_on = [
#     azurerm_cosmosdb_sql_role_definition.res-17,
#   ]
# }


# resource "azurerm_cosmosdb_sql_role_definition" "res-16" {
#   account_name        = "kmblkcosmostest"
#   assignable_scopes   = ["/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.DocumentDB/databaseAccounts/kmblkcosmostest"]
#   name                = "Cosmos DB Built-in Data Reader"
#   resource_group_name = "blktest"
#   type                = "BuiltInRole"
#   permissions {
#     data_actions = ["Microsoft.DocumentDB/databaseAccounts/readMetadata", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/executeQuery", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/read", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/readChangeFeed"]
#   }
#   depends_on = [
#     azurerm_cosmosdb_account.res-8,
#   ]
# }
# resource "azurerm_cosmosdb_sql_role_definition" "res-17" {
#   account_name        = "kmblkcosmostest"
#   assignable_scopes   = ["/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.DocumentDB/databaseAccounts/kmblkcosmostest"]
#   name                = "Cosmos DB Built-in Data Contributor"
#   resource_group_name = "blktest"
#   type                = "BuiltInRole"
#   permissions {
#     data_actions = ["Microsoft.DocumentDB/databaseAccounts/readMetadata", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/*", "Microsoft.DocumentDB/databaseAccounts/sqlDatabases/containers/items/*"]
#   }
#   depends_on = [
#     azurerm_cosmosdb_account.res-8,
#   ]
# }