variable "data_factory_name" {
  type = string
  description = "The name of the data factory."
  default = "DevDataFactory"
}


variable "resource_group_name" {
  type = string
  description = "The name of the resource group in which the data factory will be created."
  default = "DevRG"
}

variable "location" {
  type = string
  description = "The location of the resource group in which the data factory will be created."
  default = "eastus"
}