variable name {
  type = string
}

variable location {
  type = string
}

variable "resource-group-name" {
  type = string
}

variable "virtual-network-address-space" {
  type = list(string)
}

variable "subnet-address-prefixes" {
  type = list(string)
}

variable "service_principal_application_id" {
  type = string
}

variable "custom_tags" {
  description = "Custom tags that will set on the provisioned resources"
  type        = map(string)
  default     = {}
}
