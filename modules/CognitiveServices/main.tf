resource "azurerm_cognitive_account" "OpenAI" {
  custom_subdomain_name = var.custom_subdomain_name
  kind                  = var.kind
  location              = var.location
  name                  = var.name
  resource_group_name   = var.resource_group_name
  sku_name              = var.sku_name
  tags = {
    tagName = "GAIA-KM"
  }
}

resource "azurerm_cognitive_account" "cognitiveServices" {
  kind                = var.cognitive_kind
  location            = var.cognitive_location
  name                = var.cognitive_name
  resource_group_name = var.resource_group_name
  sku_name            = var.cognitive_sku_name
  tags = {
    tagName = "GAIA-KM"
  }
}

resource "azurerm_cognitive_account" "TextAnalytics" {
  kind                = var.text_analytics_kind
  location            = var.text_analytics_location
  name                = var.text_analytics_name
  resource_group_name = var.resource_group_name
  sku_name            = var.text_analytics_sku_name
  tags = {
    tagName = "GAIA-KM"
  }
}


resource "azurerm_cognitive_deployment" "Model1" {
  cognitive_account_id =  var.openai_cognitive_account_id
  name                 = var.model1_name
  model {
    format  = var.model1_format
    name    = var.model1_name
    version = var.model1_version
  }
    sku {
    name = var.model1_sku
    capacity = var.model1_scale_capacity
  }
}


# resource "azurerm_cognitive_deployment" "res-3" {
#   cognitive_account_id = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.CognitiveServices/accounts/kmblkaoaitest"
#   name                 = "akm-chat-4"
#   model {
#     format  = "OpenAI"
#     name    = "gpt-4"
#     version = "0125-Preview"
#   }
#   scale {
#     capacity = 20
#     type     = "Standard"
#   }
#   depends_on = [
#     azurerm_cognitive_account.OpenAI,
#   ]
# }
# resource "azurerm_cognitive_deployment" "res-4" {
#   cognitive_account_id = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.CognitiveServices/accounts/kmblkaoaitest"
#   name                 = "akm-embeddings"
#   model {
#     format  = "OpenAI"
#     name    = "text-embedding-ada-002"
#     version = "2"
#   }
#   scale {
#     capacity = 170
#     type     = "Standard"
#   }
#   depends_on = [
#     azurerm_cognitive_account.OpenAI,
#   ]
# }
# resource "azurerm_cognitive_deployment" "res-5" {
#   cognitive_account_id = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.CognitiveServices/accounts/kmblkaoaitest"
#   name                 = "akm-gpt4o"
#   model {
#     format  = "OpenAI"
#     name    = "gpt-4o"
#     version = "2024-05-13"
#   }
#   scale {
#     capacity = 70
#     type     = "GlobalStandard"
#   }
#   depends_on = [
#     azurerm_cognitive_account.OpenAI,
#   ]
# }
