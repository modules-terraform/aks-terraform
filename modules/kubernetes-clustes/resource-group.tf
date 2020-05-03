resource "azurerm_resource_group" "k8s" {
  name     = var.resource_group_name
  location = var.location
  tags = merge(
    {
      name       = "k8sgroup-${var.cluster_name}"
      provisoned = "terraform"
    },
    var.custom_tags
  )
}
