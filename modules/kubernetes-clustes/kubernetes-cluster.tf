resource "azurerm_kubernetes_cluster" "k8s" {

  name                = var.cluster_name
  location            = var.location
  resource_group_name = var.resource_group_name
  dns_prefix          = var.dns_prefix

  linux_profile {
    admin_username = "ubuntu"

    ssh_key {
      key_data = file(var.ssh_public_key)
    }
  }

  network_profile {
    network_plugin = "azure"
    network_policy = "calico"
  }

  default_node_pool {
    name       = "defaultpool"
    node_count = var.node_count
    vm_size    = var.default_node_pool_vm_size
    # os_type         = "Linux"
    os_disk_size_gb = var.default_node_pool_disk_size
    vnet_subnet_id = var.vnet_subnet_id
    tags = merge(
      {
        name       = "k8sdefaultnodepool-${var.cluster_name}"
        provisoned = "terraform"
      },
      var.custom_tags
    )
  }

  service_principal {
    client_id     = var.service-principal.client-id
    client_secret = var.service-principal.client-secret
  }

  # https://medium.com/@business_99069/terraform-0-12-conditional-block-7d166e4abcbf
  dynamic addon_profile {
    for_each = ! var.azuremonitor.use_azure_monitor ? [] : [1]
    content {
      oms_agent {
        enabled                    = true
        log_analytics_workspace_id = var.azuremonitor.log_analytics_workspace_id
      }
    }
  }

  kubernetes_version = var.kubernetes_version

  role_based_access_control {
    enabled = true
  }

  tags = merge(
    {
      name       = "k8s-${var.cluster_name}"
      provisoned = "terraform"
    },
    var.custom_tags
  )

}
