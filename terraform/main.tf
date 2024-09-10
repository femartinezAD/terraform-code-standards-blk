
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
  source                     = "../modules/KeyVault"
  enable_rbac_authorization  = true
  location                   = var.location
  name                       = "kmblkkvttest2"
  purge_protection_enabled   = true
  resource_group_name        = azurerm_resource_group.DevRG.name
  sku_name                   = "premium"
  soft_delete_retention_days = 7
  tenant_id                  = "16b3c013-d300-468d-ac64-7eda0820b6d3"
  cognitiveSecretkey_name = "cognitiveServicesKey"
  storageAccountKey_name = "storageAccountKey"
  storageConnectionString_name = "storageConnectionString"
  languageKey_name = "languageKey"
  tags = {
    tagName = "GAIA-KM"
  }
  depends_on = [
    azurerm_resource_group.DevRG
  ]
}

module "LogAnalyticsWorkspace"  {
  source              = "../modules/LogAnalyticsWorkspace"
  location            = azurerm_resource_group.DevRG.location
  resource_group_name = azurerm_resource_group.DevRG.name
  name                = "kmblklogtest2"
  sku                 = "PerGB2018"
  retention_days      = 30
  depends_on = [
    azurerm_resource_group.DevRG
  ]
}

module "azurerm_application_insights" {
  source             = "../modules/ApplicationInsights"
  application_type    = "web"
  location            = azurerm_resource_group.DevRG.location
  name                = "kmblkaisfunctest2"
  resource_group_name = azurerm_resource_group.DevRG.name
  sampling_percentage = 0
  workspace_id = "/subscriptions/5c13d4b2-5e84-4b41-b3be-322baf8980f2/resourceGroups/Dev_RG/providers/Microsoft.OperationalInsights/workspaces/kmblklogtest2"
  # depends_on = [
  #   azurerm_log_analytics_workspace.loganalytics,
  # ]
}

# module "DataFactory" {
#   source   = "../modules/DataFactory"
#   name = "AzureDataFactoryBLK"
#   location = azurerm_resource_group.DevRG.location
#   rg_name = azurerm_resource_group.DevRG.name
# }

# module "AzureStorage" {
#   source = "../modules/AzureStorage"
#   location = azurerm_resource_group.DevRG.location
#   rg_name = azurerm_resource_group.DevRG.name
#   storage_name = "blkstorage"
#   storage_tier = "Standard"
#   replication = "LRS"
#   container_name = "blkcontainer"
#   blob_name = "blob"
# }