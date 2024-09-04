locals {
  these = [
    "Hello, World!",
    "Goodbye, World!"
  ]
}

resource "azurerm_resource_group" "DevRG" {
  name     = "DevRG"
  location = "East US"
}
module "DataFactory" {
  source   = "../modules/DataFactory"
  location = azurerm_resource_group.DevRG.location
  resource_group_name = azurerm_resource_group.DevRG.name
  data_factory_name = "DevDataFactory"

}
