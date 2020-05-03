resource "azurerm_resource_group" "log_analytics" {
  count    = var.use_azure_monitor ? 1 : 0
  name     = var.resource_group_name
  location = var.location
  tags = merge(
    {
      name       = "azuremonitorgroup-${var.cluster_name}"
      provisoned = "terraform"
    },
    var.custom_tags
  )
}
