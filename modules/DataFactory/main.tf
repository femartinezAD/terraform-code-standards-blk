resource "azurerm_data_factory" "DataFactoryBLK" {
  name                = var. data_factory_name 
  location            = var.location 
  resource_group_name = var.data_factory_name 
}