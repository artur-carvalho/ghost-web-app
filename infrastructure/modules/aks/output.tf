output "id" {
  value = azurerm_kubernetes_cluster.ghost.id
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.ghost.kube_config_raw
}

output "client_key" {
  value = azurerm_kubernetes_cluster.ghost.kube_config.0.client_key
}

output "client_certificate" {
  value = azurerm_kubernetes_cluster.ghost.kube_config.0.client_certificate
}

output "cluster_ca_certificate" {
  value = azurerm_kubernetes_cluster.ghost.kube_config.0.cluster_ca_certificate
}