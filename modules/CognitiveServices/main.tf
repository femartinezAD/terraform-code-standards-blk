resource "azurerm_cognitive_account" "this" {
  name                  = var.name
  resource_group_name   = var.resource_group_name
  location              = var.location
  sku_name              = var.sku_name
  kind                  = var.kind
  custom_subdomain_name = var.custom_subdomain_name
  tags = {
    tagName = "GAIA-KM"
  }
}