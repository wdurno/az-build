resource "azurerm_kubernetes_cluster" "aks-cluster" {
  name                = "build-aks"
  location            = azurerm_resource_group.build_resource_group.location
  resource_group_name = azurerm_resource_group.build_resource_group.name
  dns_prefix          = "build-aks"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}
