resource "azurerm_application_insights" "appinsights" {
  application_type    = var.application_type
  location            = var.location
  name                = var.name
  resource_group_name = var.resource_group_name
  sampling_percentage = 0
  tags = {
    tagName = "GAIA-KM"
  }
  workspace_id = var.workspace_id
}