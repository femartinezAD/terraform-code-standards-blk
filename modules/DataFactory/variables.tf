variable "name" {
  type = string
  description = "The name of the data factory."
  validation {
    condition = var.name != null && length(var.name) > 0
    error_message = "The data factory name cannot be an empty string."
  }
}


variable "rg_name" {
  type = string
  description = "The name of the resource group in which the data factory will be created."
  default = "DevRG"
}

variable "location" {
  type = string
  description = "The location of the resource group in which the data factory will be created."
  default = "eastus"
}