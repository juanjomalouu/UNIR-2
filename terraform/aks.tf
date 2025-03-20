resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-UNIR"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "jjperezabadUNIR"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "casopractico2"
  }
}

resource "azurerm_role_assignment" "ra-perm" {
    principal_id = azurerm_kubernetes_cluster.aks.identity[0].principal_id
    role_definition_name = "AcrPull"
    scope = azurerm_container_registry.acr.id
}

output "client_certificate" {
  value     = azurerm_kubernetes_cluster.aks.kube_config[0].client_certificate
  sensitive = true
}

output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}