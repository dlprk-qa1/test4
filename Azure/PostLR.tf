resource "azurerm_postgresql_server" "exampleLR" {
  name                = "postgresql-server-1"
  location            = azurerm_resource_group.example.location
  resource_group_name = "api-rg-pro"
  sku_name = "B_Gen5_2"
  storage_mb                   = 5120
  backup_retention_days        = 7
  geo_redundant_backup_enabled = false
  auto_grow_enabled            = true
  administrator_login          = "psqladmin"
  administrator_login_password = "H@Sh1CoR3!"
  version                      = "9.5"
  ssl_enforcement_enabled      = false
}

resource "azurerm_postgresql_configuration" "exampleLR" {
     name                = "log_retention_days"
     resource_group_name = "api-rg-pro"
     server_name         = azurerm_postgresql_server.example.name
     value               = 2
}
