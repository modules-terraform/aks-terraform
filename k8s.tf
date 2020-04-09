resource "azurerm_kubernetes_cluster" "k8s" {
    depends_on          = [azuread_service_principal_password.akssppass, azurerm_log_analytics_solution.akslogssolution]

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
        client_secret   = "VT=uSgbTanZhyz@%nL9Hpd+Tfay_MRV#"
    }

    addon_profile {
        oms_agent {
            enabled                    = true
            log_analytics_workspace_id = azurerm_log_analytics_workspace.akslogsworkspace.id
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
