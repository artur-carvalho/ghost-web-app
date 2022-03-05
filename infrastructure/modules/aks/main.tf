resource "azurerm_kubernetes_cluster" "ghost" {
  name                = "ghost-k8s"
  location            = var.location
  resource_group_name = var.rg_name
  dns_prefix          = "ghost-k8s"
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

  oms_agent {
    log_analytics_workspace_id = var.la_workspace_id
  }

  network_profile {
    load_balancer_sku = "standard"
    network_plugin    = "azure"
  }
}