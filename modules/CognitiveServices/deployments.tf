resource "azurerm_cognitive_deployment" "Model" {
  for_each = var.kind == "OpenAi" ? tomap(var.deployments) : {}

  name                 = each.value.model_name
  cognitive_account_id = azurerm_cognitive_account.this.id
  model {
    format  = var.kind
    name    = each.value.model_name
    version = each.value.model_version

  }
  sku {
    name     = each.value.sku_name
    capacity = each.value.scale_capacity
  }
}
