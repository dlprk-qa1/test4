resource "azurerm_function_app" "remediation_example_app4" {
  name                = "example-function-app"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  app_service_plan_id = azurerm_function_app_plan.example.id

  site_config {
    ftps_state = Enabled
  }
}
