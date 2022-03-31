terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.1"
    }
  }
}

provider "azurerm" {
  # Configuration options
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = "Terraformiac"
  location = "East US"
}