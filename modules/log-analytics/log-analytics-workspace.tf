locals {
  log_analytics_workspace_name = "${var.cluster_name}LogAnalyticsWorkspace"
}

resource "azurerm_log_analytics_workspace" "akslogsworkspace" {
  count = var.use_azure_monitor ? 1 : 0
  name                = local.log_analytics_workspace_name
  location            = var.location
  resource_group_name = azurerm_resource_group.log_analytics[count.index].name
  sku                 = var.log_analytics_workspace_sku
  tags = merge(
    {
      name       = "azuremonitor-${var.cluster_name}"
      provisoned = "terraform"
    },
    var.custom_tags
  )
}
