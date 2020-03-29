variable "agent_count" {
  default = 3
  type = number
}

variable "ssh_public_key" {
  default = "./keys/azure_key.pub"
  type = string
}

variable "dns_prefix" {
  default = "aksplayground"
  type = string
}

variable cluster_name {
  default = "aksplayground"
  type = string
}

variable resource_group_name {
  default = "aksplayground-tf-group"
  type = string
}

variable "resource_group_name_data_analytics" {
  default = "aksplayground-tf-group-data-analytics-group"
  type = string
}

variable location {
  default = "brazil south"
  type = string
}

variable log_analytics_workspace_name {
  default = "testLogAnalyticsWorkspaceName"
  type = string
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
  default = "brazil south"
  type = string
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
  default = "PerGB2018"
  type = string
}
