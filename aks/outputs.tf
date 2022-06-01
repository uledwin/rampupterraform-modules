output "aks_id" {
  value = azurerm_kubernetes_cluster.aks.id
}
output "aks_fqdn" {
  value = azurerm_kubernetes_cluster.aks.fqdn
}

output "public_ip_lb" {
  value = azurerm_kubernetes_cluster.aks.network_profile[0].load_balancer_profile[0].effective_outbound_ips
  
}
output "aks_node_rg" {
  value = azurerm_kubernetes_cluster.aks.node_resource_group
}