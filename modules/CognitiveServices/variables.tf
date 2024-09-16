variable "custom_subdomain_name" {
  type = string
}

variable "kind" {
  type = string
}

variable "location" {
  type = string
}

variable "name" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "sku_name" {
  type = string
}

variable "scale_capacity" {
  type    = string
  default = "1"
}

variable "deployments" {
  type = list(object({
    model_name     = string
    model_version  = string
    sku_name       = string
    scale_capacity = string
  }))
  default = []
}
