resource "azurerm_kubernetes_cluster" "ghost" {
  name                = "ghost-aks-${var.environment}"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "ghost-aks-${var.environment}"
  tags                = var.tags

  default_node_pool {
    name       = "ghostdf"
    node_count = 1
    vm_size    = "standard_d2as_v5"
  }

  identity {
    type = "SystemAssigned"
  }

  # http_application_routing {
  #   enabled = true
  # }

  ingress_application_gateway {
    subnet_id = var.appgw_subnet_id
  }

# Integration with Azure Monitor
  oms_agent {
    log_analytics_workspace_id = var.la_workspace_id
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "azure"
  }
}

# data "azurerm_resource_group" "node_resource_group" {
#   name = azurerm_kubernetes_cluster.k8s.node_resource_group
#          depends_on = [
#      azurerm_kubernetes_cluster.k8s
#   ]
# }

# resource "azurerm_role_assignment" "node_infrastructure_update_scale_set" {
#   principal_id         = azurerm_kubernetes_cluster.k8s.kubelet_identity[0].object_id
#   scope                = data.azurerm_resource_group.node_resource_group.id
#   role_definition_name = "Virtual Machine Contributor"
#            depends_on = [
#      azurerm_kubernetes_cluster.k8s
#   ]
# }