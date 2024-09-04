resource "azurerm_data_factory" "DataFactoryBLK" {
  name                = var.name 
  location            = var.location 
  resource_group_name = var.rg_name 
}