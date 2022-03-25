resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "public1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "public2"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  subnet {
    name           = "private"
    address_prefix = "10.0.3.0/24"
    security_group = azurerm_network_security_group.example.id
  }
  tags = {
    environment = "Production"
  }
}