module "cognitiveServices" {
  source                = "../modules/CognitiveServices"
  custom_subdomain_name = "kmblkaoaitest"
  kind                  = "CognitiveServices"
  location              = azurerm_resource_group.DevRG.location
  name                  = "kmblkaoaicogservices"
  resource_group_name   = azurerm_resource_group.DevRG.name
  sku_name              = "S0"

}

module "TextAnalytics" {
  source                = "../modules/CognitiveServices"
  custom_subdomain_name = "kmblkaoaitest"
  kind                  = "TextAnalytics"
  location              = azurerm_resource_group.DevRG.location
  name                  = "kmblkaoaitextanalytisi"
  resource_group_name   = azurerm_resource_group.DevRG.name
  sku_name              = "S"

}

module "openAi" {
  source                = "../modules/CognitiveServices"
  custom_subdomain_name = "kmblkaoaitest"
  kind                  = "OpenAI"
  location              = azurerm_resource_group.DevRG.location
  name                  = "kmblkaoaitest"
  resource_group_name   = azurerm_resource_group.DevRG.name
  sku_name              = "S0"
  
  deployments = [
    {
      model_name = "gpt-35-turbo"
      model_version = "0613"
      scale_capacity = "20"
      sku_name = "Standard"
    },
  
    {
      model_name = "gpt-4"
      model_version = "0125-Preview"
      scale_capacity = "20"
      sku_name = "Standard"
    },
    {
      model_name = "text-embedding-ada-002"
      model_version = "2"
      scale_capacity = "170"
      sku_name = "Standard"
    },
    {
      model_name = "gpt-4o"
      model_version = "2024-05-13"
      scale_capacity = "70"
      sku_name = "Standard"
    }

  ]

  depends_on = [
    azurerm_resource_group.DevRG
  ]
}
