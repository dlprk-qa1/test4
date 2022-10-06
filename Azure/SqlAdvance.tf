resource "azurerm_sql_server" "exampleAdvance" {
  name                         = "mssqlserver"
  resource_group_name          = azurerm_resource_group.example.name
  location                     = azurerm_resource_group.example.location
  version                      = "12.0"
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password

    threat_detection_policy {
        state                      = "Enabled"
        retention_days             = 6
        email_addresses            = []
        storage_account_access_key = azurerm_storage_account.example.primary_access_key
        storage_endpoint           = azurerm_storage_account.example.primary_blob_endpoint
        use_server_default         = "Disabled"
   }
}
