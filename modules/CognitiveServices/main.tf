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

# resource "azurerm_cognitive_account" "res-6" {
#   kind                = "CognitiveServices"
#   location            = "westus"
#   name                = "kmblkcogtest"
#   resource_group_name = "blktest"
#   sku_name            = "S0"
#   tags = {
#     tagName = "GAIA-KM"
#   }
#   depends_on = [
#     azurerm_resource_group.res-0,
#   ]
# }

# resource "azurerm_cognitive_account" "res-7" {
#   kind                = "TextAnalytics"
#   location            = "westus"
#   name                = "kmblklangtest"
#   resource_group_name = "blktest"
#   sku_name            = "S"
#   tags = {
#     tagName = "GAIA-KM"
#   }
#   depends_on = [
#     azurerm_resource_group.res-0,
#   ]
# }


# resource "azurerm_cognitive_deployment" "res-2" {
#   cognitive_account_id = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.CognitiveServices/accounts/kmblkaoaitest"
#   name                 = "akm-chat-35"
#   model {
#     format  = "OpenAI"
#     name    = "gpt-35-turbo"
#     version = "0613"
#   }
#   scale {
#     capacity = 20
#     type     = "Standard"
#   }
#   depends_on = [
#     azurerm_cognitive_account.OpenAI,
#   ]
# }
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
