# Create AKS subnet to be used by nodes and pods
resource "azurerm_subnet" "aks" {
  name                 = "akssubnet"
  resource_group_name  = var.resource-group-name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  address_prefixes     = var.subnet-address-prefixes
}

# Grant AKS cluster access to join AKS subnet
# resource "azurerm_role_assignment" "aks_subnet" {
#   scope                = azurerm_subnet.aks.id
#   role_definition_name = "Network Contributor"
#   principal_id         = var.service_principal_application_id
# }
