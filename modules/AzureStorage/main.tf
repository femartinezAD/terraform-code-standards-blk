# resource "azurerm_storage_account" "blkstorage" {
#     name                     = var.storage_name
#     resource_group_name      = var.rg_name
#     location                 = var.location
#     account_tier             = var.storage_tier
#     account_replication_type = var.replication
# }

# resource "azurerm_storage_container" "blkcontainer" {
#     name                  = var.container_name
#     storage_account_name  = azurerm_storage_account.blkstorage.name
# }

# resource "azurerm_storage_blob" "blob" {
#     name                   = var.blob_name
#     storage_account_name   = azurerm_storage_account.blkstorage.name
#     storage_container_name = azurerm_storage_container.blkcontainer.name
#     type                   = "Block"
# }

# resource "azurerm_storage_account" "res-610" {
#   account_replication_type         = "LRS"
#   account_tier                     = "Standard"
#   allow_nested_items_to_be_public  = false
#   cross_tenant_replication_enabled = false
#   is_hns_enabled                   = true
#   location                         = "westus"
#   name                             = "kmblkstdatatest"
#   resource_group_name              = "blktest"
#   tags = {
#     tagName = "GAIA-KM"
#   }
#   identity {
#     type = "SystemAssigned"
#   }
#   depends_on = [
#     azurerm_resource_group.res-0,
#   ]
# }
# resource "azurerm_storage_container" "res-612" {
#   name                 = "documents"
#   storage_account_name = "kmblkstdatatest"
# }
# resource "azurerm_storage_container" "res-613" {
#   name                 = "images"
#   storage_account_name = "kmblkstdatatest"
# }
# resource "azurerm_storage_container" "res-614" {
#   name                 = "metadata"
#   storage_account_name = "kmblkstdatatest"
# }
# resource "azurerm_storage_container" "res-615" {
#   name                 = "translation"
#   storage_account_name = "kmblkstdatatest"
# }
# resource "azurerm_storage_account" "res-619" {
#   account_replication_type         = "LRS"
#   account_tier                     = "Standard"
#   allow_nested_items_to_be_public  = false
#   cross_tenant_replication_enabled = false
#   location                         = "westus"
#   name                             = "kmblkstsrchstptest"
#   resource_group_name              = "blktest"
#   tags = {
#     tagName = "GAIA-KM"
#   }
#   depends_on = [
#     azurerm_resource_group.res-0,
#   ]
# }
# resource "azurerm_storage_share" "res-622" {
#   name                 = "b5a5vpqryiassazscripts"
#   quota                = 2
#   storage_account_name = "kmblkstsrchstptest"
# }
# resource "azurerm_storage_account" "res-625" {
#   account_replication_type         = "LRS"
#   account_tier                     = "Standard"
#   allow_nested_items_to_be_public  = false
#   cross_tenant_replication_enabled = false
#   is_hns_enabled                   = true
#   location                         = "westus"
#   name                             = "kmblksttechtest"
#   resource_group_name              = "blktest"
#   tags = {
#     tagName = "GAIA-KM"
#   }
#   identity {
#     type = "SystemAssigned"
#   }
#   depends_on = [
#     azurerm_resource_group.res-0,
#   ]
# }
# resource "azurerm_storage_container" "res-627" {
#   name                 = "azure-webjobs-hosts"
#   storage_account_name = "kmblksttechtest"
# }
# resource "azurerm_storage_container" "res-628" {
#   name                 = "azure-webjobs-secrets"
#   storage_account_name = "kmblksttechtest"
# }
# resource "azurerm_service_plan" "res-632" {
#   location            = "westus"
#   name                = "kmblkaspragtest"
#   os_type             = "Linux"
#   resource_group_name = "blktest"
#   sku_name            = "B1"
#   tags = {
#     tagName = "GAIA-KM"
#   }
#   depends_on = [
#     azurerm_resource_group.res-0,
#   ]
# }