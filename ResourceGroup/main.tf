resource "azurerm_resource_group_template_deployment" "example" {
  name = var.rgname
  location = var.location
}