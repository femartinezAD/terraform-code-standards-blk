
locals {
  these = [
    "Hello, World!",
    "Goodbye, World!"
  ]
}

resource "azurerm_resource_group" "DevRG" {
  name     = var.rg_name
  location = var.location
}

module "keyvault" {
  source                       = "../modules/KeyVault"
  enable_rbac_authorization    = true
  location                     = var.location
  name                         = "kmblkkvttest2"
  purge_protection_enabled     = true
  resource_group_name          = azurerm_resource_group.DevRG.name
  sku_name                     = "premium"
  soft_delete_retention_days   = 7
  tenant_id                    = "16b3c013-d300-468d-ac64-7eda0820b6d3"
  cognitiveSecretkey_name      = "cognitiveServicesKey"
  storageAccountKey_name       = "storageAccountKey"
  storageConnectionString_name = "storageConnectionString"
  languageKey_name             = "languageKey"
  tags = {
    tagName = "GAIA-KM"
  }
}

module "LogAnalyticsWorkspace" {
  source              = "../modules/LogAnalyticsWorkspace" 

  name                = "kmblklogtest2"
  location            = azurerm_resource_group.DevRG.location
  resource_group_name = azurerm_resource_group.DevRG.name
  sku                 = "PerGB2018"
  retention_days      = 30
}

module "azurerm_application_insights" {
  source              = "../modules/ApplicationInsights"

  name                = "kmblkaisfunctest2"
  resource_group_name = azurerm_resource_group.DevRG.name
  location            = azurerm_resource_group.DevRG.location
  application_type    = "web"
  sampling_percentage = 0
  log_analytics_id        = module.LogAnalyticsWorkspace.id
  
  # depends_on = [
  #   azurerm_log_analytics_workspace.loganalytics,
  # ]
}

module "cosmosDB" {
  source              = "../modules/CosmosDB"
  location            = azurerm_resource_group.DevRG.location
  resource_group_name = azurerm_resource_group.DevRG.name
  name                = "kmblkcosdbtest"
  offer_type          = "Standard"

  tags = {
    tagName = "GAIA-KM"
  }
    consistency_level = "Session"
    failover_priority = 0
    identity_type = "SystemAssigned"
    
  depends_on = [
    azurerm_resource_group.DevRG
  ]
}

module "AzureStorage" {
  source = "../modules/AzureStorage"
  location = azurerm_resource_group.DevRG.location
  resource_group_name = azurerm_resource_group.DevRG.name
  storage_name = "kmblkstdatatest"
  storage_tier = "Standard"
  replication = "LRS"
  nested_items_public = false
  cross_tenant_replication_enabled = false
  is_hns_enabled = true
  container_name = "documents"
  container_name2 = "images"
  container_name3 = "metadatar"
  container_name4 = "translation"
    depends_on = [
    azurerm_resource_group.DevRG,
  ]
}

# module "DataFactory" {
#   source   = "../modules/DataFactory"
#   name = "AzureDataFactoryBLK"
#   location = azurerm_resource_group.DevRG.location
#   rg_name = azurerm_resource_group.DevRG.name
# }

