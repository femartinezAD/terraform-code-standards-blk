resource "azurerm_storage_account" "blkstorage" {
    name                     = var.storage_name
    resource_group_name      = var.rg_name
    location                 = var.location
    account_tier             = var.storage_tier
    account_replication_type = var.replication
}

resource "azurerm_storage_container" "blkcontainer" {
    name                  = var.container_name
    storage_account_name  = azurerm_storage_account.blkstorage.name
}

resource "azurerm_storage_blob" "blob" {
    name                   = var.blob_name
    storage_account_name   = azurerm_storage_account.blkstorage.name
    storage_container_name = azurerm_storage_container.blkcontainer.name
    type                   = "Block"
}