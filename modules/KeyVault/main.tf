resource "azurerm_key_vault" "blk-kv" {
  enable_rbac_authorization  = var.enable_rbac_authorization
  location                   = var.location
  name                       = var.name
  purge_protection_enabled   = var.purge_protection_enabled
  resource_group_name        = var.resource_group_name
  sku_name                   = var.sku_name
  soft_delete_retention_days = var.soft_delete_retention_days
  tags = {
    tagName =  var.tags["tagName"]
  }
  tenant_id = var.tenant_id
}

# resource "azurerem_key_vault_secret" "cognitiveSecret" {
#    name         = "cognitiveServicesKey"
#   key_vault_id = azurerm_key_vault.keyvault.id

#   value        = azurerm_cognitive_account.cognitiveAccount.primary_access_key
#   content_type = "string"
# }

# resource "azurerm_key_vault_secret" "storageAccountKey" {
#   name         = "storageAccountKey"
#   key_vault_id = azurerm_key_vault.keyvault.id

#   value        = azurerm_storage_account.sta.primary_access_key
#   content_type = "string"
# }
# resource "azurerm_key_vault_secret" "storageConnectionString" {
#   name         = "storageConnectionString"
#   key_vault_id = azurerm_key_vault.keyvault.id

#   value        = "DefaultEndpointsProtocol=https;AccountName=${azurerm_storage_account.sta.name};AccountKey=${azurerm_storage_account.sta.primary_access_key};EndpointSuffix=${azurerm_environment.environment.suffixes.storage}"
#   content_type = "string"
# }

# resource "azurerm_key_vault_secret" "languageKey" {
#   name         = "cogSvcLanguageKey"
#   key_vault_id = azurerm_key_vault.keyvault.id

#   value        = azurerm_cognitive_account.language.primary_access_key
#   content_type = "string"
# }