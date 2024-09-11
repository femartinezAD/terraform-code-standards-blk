resource "azurerm_cosmosdb_account" "res-8" {
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


# resource "azurerm_cosmosdb_sql_database" "res-9" {
#   account_name        = "kmblkcosmostest"
#   name                = "GAIA"
#   resource_group_name = "blktest"
#   autoscale_settings {
#   }
#   depends_on = [
#     azurerm_cosmosdb_account.res-8,
#   ]
# }
# resource "azurerm_cosmosdb_sql_container" "res-10" {
#   account_name        = "kmblkcosmostest"
#   database_name       = "GAIA"
#   name                = "ChatHistories"
#   partition_key_path  = "/partitionKey"
#   resource_group_name = "blktest"
#   autoscale_settings {
#   }
#   depends_on = [
#     azurerm_cosmosdb_sql_database.res-9,
#   ]
# }
# resource "azurerm_cosmosdb_sql_container" "res-12" {
#   account_name        = "kmblkcosmostest"
#   database_name       = "GAIA"
#   name                = "Feedbacks"
#   partition_key_path  = "/partitionKey"
#   resource_group_name = "blktest"
#   autoscale_settings {
#   }
#   depends_on = [
#     azurerm_cosmosdb_sql_database.res-9,
#   ]
# }
# resource "azurerm_cosmosdb_sql_role_assignment" "res-15" {
#   account_name        = "kmblkcosmostest"
#   principal_id        = "8295c3e0-9d08-4a85-abab-f3b7815092fb"
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