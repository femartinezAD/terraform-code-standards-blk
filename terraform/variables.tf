variable "rg_name" {
  type    = string
  default = "Dev_RG"
}

variable "location" {
  type    = string
  default = "East US"
  
}


variable "config_variable" {
  type    = string
  default = "default_value"
}

variable "pipeline_variable" {
  type    = string
  default = "default_value"
}

variable "environment_variable" {
  type    = string
  default = "default_value"
}