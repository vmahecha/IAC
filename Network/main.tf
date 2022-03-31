resource "azurerm_virtual_network" "example" {
  name                = "${var.base_name}vnet"
  location            = var.location
  resource_group_name = var.resource_group_name
  address_space       = ["10.0.0.0/16"]

  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
    security_group = var.nsg_name
  }

  tags = {
    environment = "challenge"
  }
}

resource "azurerm_network_interface" "example" {
  name                = "${var.base_name}nic"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_virtual_network.example.subnet.*.id[0]
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_network_interface_security_group_association" "example" {
  network_interface_id      = azurerm_network_interface.example.id
  network_security_group_id = var.nsg_id
}