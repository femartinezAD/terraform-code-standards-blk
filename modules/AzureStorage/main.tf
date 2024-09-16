resource "azurerm_storage_account" "storage_account" {
  account_replication_type         = var.replication
  account_tier                     = var.storage_tier
  allow_nested_items_to_be_public  = var.nested_items_public
  cross_tenant_replication_enabled = var.cross_tenant_replication_enabled
  is_hns_enabled                   = var.is_hns_enabled
  location                         = var.location
  name                             = var.storage_name
  resource_group_name              = var.resource_group_name
  tags = {
    tagName = "GAIA-KM"
  }
  identity {
    type = "SystemAssigned"
  }
}

resource "azurerm_storage_container" "doc_container" {
  name                 = var.container_name
  storage_account_name = var.storage_name
}

resource "azurerm_storage_container" "image_container" {
  name                 = var.container_name2
  storage_account_name = var.storage_name
}

resource "azurerm_storage_container" "metatdata_container" {
  name                 = var.container_name3
  storage_account_name = var.storage_name
}

resource "azurerm_storage_container" "translation_container" {
  name                 = var.container_name4
  storage_account_name = var.storage_name
}

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