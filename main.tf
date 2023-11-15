provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "prod" {
  name     = "MalekFRRessourceGroup"
  location = "East US"
}

resource "azurerm_kubernetes_cluster" "prodk8s" {
  name                = "MalekFRAKSCluster"
  location            = azurerm_resource_group.prod.location
  resource_group_name = azurerm_resource_group.prod.name
  dns_prefix          = "myaksdns"

  default_node_pool {
    name       = "default"
    node_count = 1
    vm_size    = "Standard_D2_v2"
  }

  identity {
    type = "SystemAssigned"
  }
}

output "kube_config" {
  value     = azurerm_kubernetes_cluster.prodk8s.kube_config_raw
  sensitive = true
}

output "cluster_name" {
  value = azurerm_kubernetes_cluster.prodk8s.name
}