resource "azurerm_log_analytics_workspace" "loganalytics" {
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  tags = {
    tagName = "GAIA-KM"
  }
  identity {
    type = "SystemAssigned"
  }
   retention_in_days = var.retention_days
   sku               = var.sku
}