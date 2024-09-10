resource "azurerm_key_vault" "blk-kv" {
  enable_rbac_authorization  = var.enable_rbac_authorization
  location                   = var.location
  name                       = var.name
  purge_protection_enabled   = var.purge_protection_enabled
  resource_group_name        = var.rg_name
  sku_name                   = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days
  tags = {
    tagName =  var.tags["tagName"]
  }
  tenant_id = var.tenant_id
}