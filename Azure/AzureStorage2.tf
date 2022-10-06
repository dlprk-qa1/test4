resource "azurerm_storage_account" "exampleStorage3" {
  name                     = "storageaccountname"
  resource_group_name      = azurerm_resource_group.example.name
  location                 = azurerm_resource_group.example.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_role_assignment" "example" {
  scope                = azurerm_storage_account.example.id
  role_definition_name = "Storage Account Key Operator Service Role"
  principal_id         = "727055f9-0386-4ccb-bcf1-9237237ee102"
}

