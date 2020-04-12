resource "null_resource" "provision" {
   depends_on = [azuread_service_principal_password.akssppass, azurerm_log_analytics_solution.akslogssolution]
   provisioner "local-exec" {
    command = "sleep 120"
  }
}

resource "azurerm_kubernetes_cluster" "k8s" {
    depends_on          = [azuread_service_principal_password.akssppass, azurerm_log_analytics_solution.akslogssolution, null_resource.provision]

    name                = var.cluster_name
    location            = azurerm_resource_group.k8s.location
    resource_group_name = azurerm_resource_group.k8s.name
    dns_prefix          = var.dns_prefix

    linux_profile {
        admin_username  = "ubuntu"

        ssh_key {
            key_data    = file(var.ssh_public_key)
        }
    }

    network_profile {
        network_plugin = "azure"
        network_policy = "calico"
    }

    default_node_pool {
        name            = "agentpool"
        node_count      = var.agent_count
        vm_size         = var.default_node_pool_vm_size
        # os_type         = "Linux"
        os_disk_size_gb = var.default_node_pool_disk_size
        vnet_subnet_id = azurerm_subnet.aks.id
    }

    service_principal {
        client_id       = azuread_service_principal.aksadsp.application_id
        client_secret   = random_string.password.result
    }

    # https://medium.com/@business_99069/terraform-0-12-conditional-block-7d166e4abcbf
    dynamic addon_profile {
        for_each = !var.use_azure_monitor  ? [] : [1]
        content {
            oms_agent {
                enabled                    = true
                log_analytics_workspace_id = azurerm_log_analytics_workspace.akslogsworkspace[0].id
            }
        }
    }

    kubernetes_version = var.kubernetes_version

    role_based_access_control {
        enabled = true
    }

    tags = {
        Environment = "Development"
    }
}
