resource "azurerm_resource_group" "example_sql_enable" {
  name     = "example-resources"
  location = "West Europe"
}

resource "azurerm_sql_server" "example_sql_enable" {
  name                         = "mysqlserver"
  resource_group_name          = "api-rg-test"
  location                     = "West US"
  version                      = "12.0"
  administrator_login          = "4dm1n157r470r"
  administrator_login_password = "4-v3ry-53cr37-p455w0rd"
}

resource "azurerm_sql_firewall_rule" "example_sql_enable" {
  name                = "FirewallRule1"
  resource_group_name = "api-rg-test"
  server_name         = "mysqlserver"
  start_ip_address    = "0.0.0.0"
  end_ip_address      = "0.0.0.0"
}
