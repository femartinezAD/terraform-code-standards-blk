variable "name" {
    description = "Name of the Log Analytics workspace"
    type        = string
}

variable "resource_group_name" {
    description = "Name of the resource group where the Log Analytics workspace will be created"
    type        = string
}

variable "location" {
    description = "Azure region where the Log Analytics workspace will be deployed"
    type        = string
}

variable "sku" {
    description = "SKU (pricing tier) of the Log Analytics workspace"
    type        = string
    default     = "PerGB2018"
}

variable "retention_days" {
    description = "Number of days to retain data in the Log Analytics workspace"
    type        = number
    default     = 30
}