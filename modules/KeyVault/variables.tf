variable "enable_rbac_authorization" {
  description = "Enable RBAC authorization for the Key Vault"
  type        = bool
  default     = true
}

variable "location" {
  description = "The location of the Key Vault"
  type        = string
  default     = "eastus"
}

variable "name" {
  description = "The name of the Key Vault"
  type        = string
  default     = "kmblkkvttest"
}

variable "purge_protection_enabled" {
  description = "Enable purge protection for the Key Vault"
  type        = bool
  default     = true
}

variable "resource_group_name" {
  description = "The name of the resource group"
  type        = string
}

variable "sku_name" {
  description = "The SKU name of the Key Vault"
  type        = string
  default     = "premium"
}

variable "soft_delete_retention_days" {
  description = "The number of days to retain soft-deleted items"
  type        = number
  default     = 7
}

variable "tags" {
  description = "Tags to assign to the Key Vault"
  type        = map(string)
  default     = {
    tagName = "GAIA-KM"
  }
}

variable "tenant_id" {
  description = "The tenant ID for the Key Vault"
  type        = string
}

variable "cognitiveSecretkey_name" {
  description = "Name of the secret to store the Cognitive Services key"
  type        = string
  #default     = "cognitiveServicesKey"
}

variable "storageAccountKey_name" {
  description = "Name of the secret to store the Storage Account key"
  type        = string
  #default     = "storageAccountKey"
}

variable "storageConnectionString_name" {
  description = "Name of the secret to store the Storage Account connection string"
  type        = string
  # default     = "storageConnectionString"
}

variable "languageKey_name" {
  description = "Name of the secret to store the Cognitive Services Language key"
  type        = string
  default     = "cogSvcLanguageKey"
}
