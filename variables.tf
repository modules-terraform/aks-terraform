variable "agent_count" {
  default = 3
  type = number
}

variable "kubernetes_version" {
  type = string
}

variable "ssh_public_key" {
  type = string
}

variable "dns_prefix" {
  type = string
}

variable cluster_name {
  type = string
}

variable default_node_pool_vm_size {
  default = "Standard_DS3_v2"
  type = string
}

variable default_node_pool_disk_size {
  default = 50
  type = number
}

variable resource_group_name {
  type = string
}

variable "resource_group_name_data_analytics" {
  type = string
}

variable location {
  type = string
}

variable log_analytics_workspace_name {
  type = string
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
variable log_analytics_workspace_location {
  type = string
}

# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
  default = "PerGB2018"
  type = string
}
