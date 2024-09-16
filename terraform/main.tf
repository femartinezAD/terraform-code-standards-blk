
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

module "azurerm_application_insights" {
  source              = "../modules/ApplicationInsights"
  application_type    = "web"
  location            = azurerm_resource_group.DevRG.location
  name                = "kmblkaisfunctest2"
  resource_group_name = azurerm_resource_group.DevRG.name
  sampling_percentage = 0
  workspace_id        = "/subscriptions/5c13d4b2-5e84-4b41-b3be-322baf8980f2/resourceGroups/Dev_RG/providers/Microsoft.OperationalInsights/workspaces/kmblklogtest2"
  # depends_on = [
  #   azurerm_log_analytics_workspace.loganalytics,
  # ]
}

module "cognitiveServices" {
  source                = "../modules/CognitiveServices"
  custom_subdomain_name = "kmblkaoaitest"
  kind                  = "OpenAI"
  location              = azurerm_resource_group.DevRG.location
  name                  = "kmblkaoaitest"
  resource_group_name   = azurerm_resource_group.DevRG.name
  sku_name              = "S0"
  cognitive_kind = "CognitiveServices"
  cognitive_location = azurerm_resource_group.DevRG.location
  cognitive_name = "kmblkcogtest"
  cognitive_sku_name = "S0"
  text_analytics_name = "kmblklangtest"
  text_analytics_location = azurerm_resource_group.DevRG.location
  text_analytics_kind = "TextAnalytics"
  text_analytics_sku_name = "S"
  openai_cognitive_account_id =  module.cognitiveServices.openai_cognitive_account_id
  model1_deployment_name = "akm-chat-35"
  model_format = "OpenAI"
  model1_name = "gpt-35-turbo"
  model1_version = "0613"
  model1_scale_capacity = "20"
  model1_sku = "Standard"
  model2_deployment_name = "akm-chat-4"
  model2_name = "gpt-4"
  model2_version = "0125-Preview"
  model2_scale_capacity = "20"
  model2_sku = "Standard"
  model3_deployment_name = "akm-embeddings"
  model3_name = "text-embedding-ada-002"
  model3_version = "2"
  model3_scale_capacity =  "170"
  model3_sku = "Standard"
  model4_deployment_name = "akm-gpt4o"
  model4_name = "gpt-4o"
  model4_version = "2024-05-13"
  model4_scale_capacity =   "70"
  model4_sku = "Standard"
  depends_on = [
    azurerm_resource_group.DevRG
  ]
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

