variable "location" {
    description = "The location of the Azure Storage account"
    type        = string
    default     = "eastus"
}

variable "resource_group_name" {
    description = "The name of the resource group in which the Azure Storage account will be created"
    type        = string
    default     = "DevRG"
}


variable "storage_name" {
    description = "The name of the Azure Storage account"
    type        = string
}


variable "replication" {
    description = "The replication type of the Azure Storage account"
    type        = string
    default     = "LRS"
}

variable "storage_tier" {
    description = "The storage tier of the Azure Storage account"
    type        = string
    default     = "Standard"
}

variable "nested_items_public" {
    description = "Allow nested items to be public"
    type        = bool
    default     = false
}

variable "cross_tenant_replication_enabled" {
    description = "Cross tenant replication enabled"
    type        = bool
    default     = false
}

variable "is_hns_enabled" {
    description = "Is HNS enabled"
    type        = bool
    default     = true
}

variable "container_name" {
    description = "The name of the Azure Storage container"
    type        = string
}

variable "container_name2" {
    description = "The name of the Azure Storage container"
    type        = string
}

variable "container_name3" {
    description = "The name of the Azure Storage container"
    type        = string
}

variable "container_name4" {
    description = "The name of the Azure Storage container"
    type        = string
}
# variable "blob_name" {
#     description = "The name of the Azure Storage blob"
#     type        = string
# }

# variable "blob_type" {
#     description = "The type of the Azure Storage blob"
#     type        = string
#     default     = "Block"
  
# }