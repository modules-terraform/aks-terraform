output "client-key" {
  value = module.kubernetes-cluster.client-key
}

output "client-certificate" {
  value = module.kubernetes-cluster.client-certificate
}

output "cluster-ca-certificate" {
  value = module.kubernetes-cluster.cluster-ca-certificate
}

output "cluster-username" {
  value = module.kubernetes-cluster.cluster-username
}

output "cluster-password" {
  value = module.kubernetes-cluster.cluster-password
}

output "kube-config" {
  value = module.kubernetes-cluster.kube-config
}

output "host" {
  value = module.kubernetes-cluster.host
}