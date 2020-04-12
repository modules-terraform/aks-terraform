resource "azurerm_resource_group" "k8s" {
    name     = var.resource_group_name
    location = var.location
}

resource "azurerm_resource_group" "log_analytics" {
    count               = var.use_azure_monitor ? 1 : 0
    name     = var.resource_group_name_data_analytics
    location = var.location
}
