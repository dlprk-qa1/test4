resource "azurerm_resource_group" "example_vm4" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_kubernetes_cluster" "example" {
  name                = "example-aks1"
  #zpc-skip-policy: ZS-AZURE-00002:testing
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  dns_prefix          = "exampleaks1"

  azure_active_directory_role_based_access_control {
      managed                 = false
      azure_rbac_enabled      = false
    }
}
