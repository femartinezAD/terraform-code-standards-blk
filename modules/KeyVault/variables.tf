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

variable "rg_name" {
  description = "The name of the resource group"
  type        = string
  default     = "blktest"
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
