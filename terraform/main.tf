
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
  depends_on = [
    azurerm_resource_group.DevRG
  ]
}

module "LogAnalyticsWorkspace" {
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