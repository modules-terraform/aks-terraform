resource "azurerm_virtual_network" "aksvnet" {
  name                = "${var.cluster_name}-network"
  location            = var.location
  resource_group_name = azurerm_resource_group.k8s.name
  address_space       = ["10.240.0.0/16"]
}

# Create AKS subnet to be used by nodes and pods
resource "azurerm_subnet" "aks" {
  name                 = "akssubnet"
  resource_group_name  = azurerm_resource_group.k8s.name
  virtual_network_name = azurerm_virtual_network.aksvnet.name
  address_prefix       = "10.240.1.0/24"
}

# Grant AKS cluster access to join AKS subnet
resource "azurerm_role_assignment" "aks_subnet" {
  scope                = azurerm_subnet.aks.id
  role_definition_name = "Contributor"
  principal_id         = azuread_service_principal.aksadsp.id
}
