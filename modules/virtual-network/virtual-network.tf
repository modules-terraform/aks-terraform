# https://github.com/terraform-providers/terraform-provider-azurerm/issues/3157#issuecomment-479207069
resource "azurerm_virtual_network" "aksvnet" {
  name                = "${var.name}-network"
  location            = var.location
  resource_group_name = var.resource-group-name
  address_space       = var.virtual-network-address-space
  tags = merge(
    {
      name       = "k8svnet-${var.name}"
      provisoned = "terraform"
    },
    var.custom_tags
  )
}
