agent_count = 2

kubernetes_version = "1.16.7"

ssh_public_key = "./keys/azure_key.pub"

dns_prefix = "aksplayground"

cluster_name = "aksplayground"

default_node_pool_vm_size = "Standard_B2s"

default_node_pool_disk_size = 64

resource_group_name = "aksplayground-tf-group"

resource_group_name_data_analytics = "aksplayground-tf-group-data-analytics-group"

location = "east us 2"

log_analytics_workspace_location = "east us 2"

use_azure_monitor = true

custom_tags = {
}