variable "client_id" { 
    default = "6df44998-6775-48f0-83a1-a6197b03064e"
}
variable "client_secret" {
    default = "fe744eca-58ea-4b6d-bcb2-2aad589bd6f0"
}

variable "agent_count" {
    default = 3
}

variable "ssh_public_key" {
    default = "./keys/azure_key.pub"
}

variable "dns_prefix" {
    default = "aksplayground"
}

variable cluster_name {
    default = "aksplayground"
}

variable resource_group_name {
    default = "aksplayground-tf-group"
}

variable "resource_group_name_data_analytics" {
  default = "aksplayground-tf-group-data-analytics-group"
}

variable location {
    default = "brazil south"
}

variable log_analytics_workspace_name {
    default = "testLogAnalyticsWorkspaceName"
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
    default = "brazil south"
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
    default = "PerGB2018"
}
