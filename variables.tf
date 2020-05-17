variable "node_count" {
  default = 3
  type    = number
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
  type    = string
}

variable default_node_pool_disk_size {
  default = 50
  type    = number
}

variable resource_group_name {
  type = string
}

variable location {
  type = string
}

# refer https://azure.microsoft.com/global-infrastructure/services/?products=monitor for log analytics available regions
# refer https://azure.microsoft.com/pricing/details/monitor/ for log analytics pricing 
variable log_analytics_workspace_sku {
  default = "PerGB2018"
  type    = string
}

variable use_azure_monitor {
  default = true
  type    = bool
}

# https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9
variable "custom_tags" {
  description = "Custom tags that will set on the provisioned resources"
  type        = map(string)
  default     = {}
}