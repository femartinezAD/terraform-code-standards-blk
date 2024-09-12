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
    format  = var.model_format
    name    = var.model1_name
    version = var.model1_version
  }
    sku {
    name = var.model1_sku
    capacity = var.model1_scale_capacity
  }
    depends_on = [
    azurerm_cognitive_account.OpenAI,
  ]
}


resource "azurerm_cognitive_deployment" "Model2" {
  cognitive_account_id = "/subscriptions/b7840bca-7b37-44a4-ac7e-f0568c1d3d85/resourceGroups/blktest/providers/Microsoft.CognitiveServices/accounts/kmblkaoaitest"
  name                 = var.model2_deployment_name
  model {
    format  = var.model_format
    name    = var.model2_name
    version = var.model2_version
  }    
  sku {
    name = var.model2_sku
    capacity = var.model2_scale_capacity
  }
  depends_on = [
    azurerm_cognitive_account.OpenAI,
  ]
}

resource "azurerm_cognitive_deployment" "model3" {
  cognitive_account_id = var.openai_cognitive_account_id
  name                 = var.model3_deployment_name
  model {
    format  = var.model_format
    name    = var.model3_name
    version = var.model3_version
  }
  sku {
    name = var.model3_sku
    capacity = var.model3_scale_capacity
  }
  depends_on = [
    azurerm_cognitive_account.OpenAI,
  ]
}

resource "azurerm_cognitive_deployment" "model4" {
  cognitive_account_id = var.openai_cognitive_account_id
  name                 = var.model4_deployment_name
  model {
    format  = var.model_format
    name    = var.model4_version
    version = "var.model4_version"
  }
 sku {
    name = var.model4_sku
    capacity = var.model4_scale_capacity
  }
  depends_on = [
    azurerm_cognitive_account.OpenAI,
  ]
}
