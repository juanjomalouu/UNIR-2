# Recurso para crear un Azure Kubernetes Service
resource "azurerm_kubernetes_cluster" "aks" {
  name                = "aks-UNIR"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  dns_prefix          = "jjperezabadUNIR"

  default_node_pool {
    name       = "default"
    node_count = 2
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }

  tags = {
    Environment = "casopractico2"
  }
}

# Recurso para que el AKS pueda acceder al ACR
resource "azurerm_role_assignment" "ra-perm" {
    principal_id = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
    role_definition_name = "Contributor"
    scope = azurerm_container_registry.acr.id
}

# Output para obtener la configuración de kubectl
output "kube_config" {
  value = azurerm_kubernetes_cluster.aks.kube_config_raw

  sensitive = true
}