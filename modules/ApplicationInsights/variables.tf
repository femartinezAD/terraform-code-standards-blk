# variables.tf

variable "resource_group_name" {
    description = "Name of the resource group where Application Insights will be deployed"
    type        = string
}

variable "location" {
    description = "Azure region where Application Insights will be deployed"
    type        = string
}

variable "name" {
    description = "Name of the Application Insights instance"
    type        = string
}

variable "kind" {
    description = "Kind of the Application Insights instance"
    type        = string
    default     = "web"
}

variable "application_type" {
    description = "Type of the application being monitored by Application Insights"
    type        = string
    default     = "web"
}

variable "retention_in_days" {
    description = "Retention period in days for the telemetry data"
    type        = number
    default     = 30
}

variable "sampling_percentage" {
    description = "Percentage of the telemetry data to sample"
    type        = number
    default     = 0
}

variable "log_analytics_id" {
    description = "Resource ID of the Log Analytics workspace to link to the Application Insights instance"
    type        = string
}

