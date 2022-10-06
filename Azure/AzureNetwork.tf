resource "azurerm_network_security_group" "example_network" {
  name                = "acceptanceTestSecurityGroup1"
  location            = "West Europe"
  resource_group_name = "example-resources"
  #zpc-skip-policy: ZS-AZURE-00033:testing
  security_rule {
    name                       = "test123"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    destination_port_range     = "3389"
    source_address_prefix      = "Internet"
    destination_address_prefix = "*"
  }
  tags = {
    environment = "Production"
  }
}
