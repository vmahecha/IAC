output "subnet_id" {
  value = azurerm_virtual_network.example.subnet.*.id
}
output "nic_id" {
  value = azurerm_network_interface.example.id
}