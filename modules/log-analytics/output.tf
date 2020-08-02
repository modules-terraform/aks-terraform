# https://github.com/hashicorp/terraform/issues/23222#issuecomment-547399016
output "workspace-id"{
    value =  length(azurerm_log_analytics_workspace.akslogsworkspace) > 0 ? azurerm_log_analytics_workspace.akslogsworkspace[0].id : ""
}