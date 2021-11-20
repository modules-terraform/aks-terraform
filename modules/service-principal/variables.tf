variable "service_principal_end_data" {
    type = string
}

variable "name" {
    type = string
    description = "Service principal name"
}

variable "custom_tags" {
  description = "Custom tags that will set on the provisioned resources"
  type        = list(string)
  default     = []
}