locals {
   log_analytics_workspace_name = "${var.cluster_name}LogAnalyticsWorkspace"
}

resource "random_id" "log_analytics_workspace_name_suffix" {
    count               = var.use_azure_monitor ? 1 : 0
    byte_length         = 8
}

resource "azurerm_log_analytics_workspace" "akslogsworkspace" {
    count               = var.use_azure_monitor ? 1 : 0
    # The WorkSpace name has to be unique across the whole of azure, not just the current subscription/tenant.
    name                = "${local.log_analytics_workspace_name}-${random_id.log_analytics_workspace_name_suffix[count.index].dec}"
    location            = var.log_analytics_workspace_location
    resource_group_name = azurerm_resource_group.log_analytics[count.index].name
    sku                 = var.log_analytics_workspace_sku
    tags = merge(
        {
            name = "azuremonitor-${var.cluster_name}"
            provisoned = "terraform"
        },
        var.custom_tags
    )
}

resource "azurerm_log_analytics_solution" "akslogssolution" {
    count                 = var.use_azure_monitor ? 1 : 0
    solution_name         = "ContainerInsights"
    location              = azurerm_log_analytics_workspace.akslogsworkspace[count.index].location
    resource_group_name   = azurerm_resource_group.log_analytics[count.index].name
    workspace_resource_id = azurerm_log_analytics_workspace.akslogsworkspace[count.index].id
    workspace_name        = azurerm_log_analytics_workspace.akslogsworkspace[count.index].name

    plan {
        publisher         = "Microsoft"
        product           = "OMSGallery/ContainerInsights"
    }
}
