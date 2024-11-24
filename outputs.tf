#output "nginx_public_ip" {
#  value = kubernetes_service.nginx.status[0].load_balancer[0].ingress[0].ip
#}

output "aks_cluster_name" {
  value = azurerm_kubernetes_cluster.aks_cluster.name
}

output "acr_url" {
  description = "The URL of the Azure Container Registry"
  value       = azurerm_container_registry.aks_acr.login_server
}