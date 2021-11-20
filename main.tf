terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "2.29.0"
        }
    }
}

provider "azurerm" {
  features {}
}


# locals {
#   for_each = var.custom_tags 
#   sp_tags  = concat(
#     each.value
#   )
# }

data "azurerm_kubernetes_service_versions" "aks-version" {
  location        = var.location
  include_preview = false
}

module "serviceprincipal" {
  source                     = "./modules/service-principal"
  service_principal_end_data = "2021-12-31T23:59:59Z"
  name                       = "${var.cluster_name}_sp_tfcreated"
}

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

module "virtual-network" {
  source                           = "./modules/virtual-network"
  name                             = var.cluster_name
  location                         = var.location
  resource-group-name              = azurerm_resource_group.k8s.name
  virtual-network-address-space    = var.virtual-network-address-space
  subnet-address-prefixes          = var.subnet-address-prefixes
  service_principal_application_id = module.serviceprincipal.service_principal_application_id
  custom_tags                      = var.custom_tags
}

module "log-analytics" {
  source                      = "./modules/log-analytics"
  use_azure_monitor           = var.use_azure_monitor
  resource_group_name         = "${var.resource_group_name}-loganalytics-group"
  location                    = var.location
  log_analytics_workspace_sku = var.log_analytics_workspace_sku
  cluster_name                = var.cluster_name
  custom_tags                 = var.custom_tags
}

module kubernetes-cluster {
  source                      = "./modules/kubernetes-clustes"
  node_count                  = var.node_count
  kubernetes_version          = data.azurerm_kubernetes_service_versions.aks-version.latest_version
  ssh_public_key              = var.ssh_public_key
  dns_prefix                  = var.dns_prefix
  cluster_name                = var.cluster_name
  default_node_pool_vm_size   = var.default_node_pool_vm_size
  default_node_pool_disk_size = var.default_node_pool_disk_size
  vnet_subnet_id              = module.virtual-network.subnet-id
  service-principal = {
    client-id     = module.serviceprincipal.application_id
    client-secret = module.serviceprincipal.password
  }
  resource_group_name = azurerm_resource_group.k8s.name
  location            = var.location
  azuremonitor = {
    use_azure_monitor          = var.use_azure_monitor
    log_analytics_workspace_id = module.log-analytics.workspace-id
  }
  custom_tags = var.custom_tags
}