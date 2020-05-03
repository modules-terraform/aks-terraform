output "workspace-id"{
    value = azurerm_log_analytics_workspace.akslogsworkspace[0].id
}