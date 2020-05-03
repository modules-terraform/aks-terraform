variable "agent_count" {
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

variable vnet_subnet_id {
  type = string
}

variable service-principal {
  type = object({
    client-id = string
    client-secret = string
  })
}

variable resource_group_name {
  type = string
}

variable location {
  type = string
}

variable azuremonitor{
  type = object({
    use_azure_monitor = bool
    log_analytics_workspace_id = string
  })
}

# https://blog.gruntwork.io/terraform-tips-tricks-loops-if-statements-and-gotchas-f739bbae55f9
variable "custom_tags" {
  description = "Custom tags that will set on the provisioned resources"
  type        = map(string)
}