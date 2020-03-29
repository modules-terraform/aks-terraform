resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_resource_group" "log_analytics" {
    name     = var.resource_group_name_data_analytics
    location = var.location
}
