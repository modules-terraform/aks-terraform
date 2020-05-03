output "client-key" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_key
}

output "client-certificate" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.client_certificate
}

output "cluster-ca-certificate" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.cluster_ca_certificate
}

output "cluster-username" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.username
}

output "cluster-password" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.password
}

output "kube-config" {
  value = azurerm_kubernetes_cluster.k8s.kube_config_raw
}

output "host" {
  value = azurerm_kubernetes_cluster.k8s.kube_config.0.host
}