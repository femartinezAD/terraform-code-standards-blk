
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
  name = "AzureDataFactoryBLK"
  location = azurerm_resource_group.DevRG.location
  rg_name = azurerm_resource_group.DevRG.name
}
