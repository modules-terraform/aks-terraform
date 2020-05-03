resource "azurerm_log_analytics_solution" "akslogssolution" {
  count                 = var.use_azure_monitor ? 1 : 0
  solution_name         = "ContainerInsights"
  location              = azurerm_log_analytics_workspace.akslogsworkspace[count.index].location
  resource_group_name   = azurerm_resource_group.log_analytics[count.index].name
  workspace_resource_id = azurerm_log_analytics_workspace.akslogsworkspace[count.index].id
  workspace_name        = azurerm_log_analytics_workspace.akslogsworkspace[count.index].name

  plan {
    publisher = "Microsoft"
    product   = "OMSGallery/ContainerInsights"
  }
}
