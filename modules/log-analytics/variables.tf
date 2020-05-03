variable "use_azure_monitor" {
  default = true
  type    = bool
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable log_analytics_workspace_sku {
  type    = string
}

variable "cluster_name" {
  type = string
}

variable "custom_tags" {
  description = "Custom tags that will set on the provisioned resources"
  type        = map(string)
  default     = {}
}