resource "azurerm_resource_group" "exampleStorage1" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_storage_account" "example" {
  resource_group_name      = "example-resources"
  #zpc-skip-policy: ZS-AZURE-00003,ZS-AZURE-00043,ZS-AZURE-00035:testing
  location                 = "West Europe"
  account_tier             = "Standard"
  account_replication_type = "GRS"
  enable_https_traffic_only = false

  tags = {
    environment = "staging"
  }
}
