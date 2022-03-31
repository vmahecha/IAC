terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.0.1"
    }
  }
}

provider "azurerm" {
  features {
    
  }
}

module "ResourceGroup" {
  source = "./ResourceGroup"
  base_name = "Terraformiac"
  location = "East US"
}

module "Security" {
  source = "./Security"
  base_name = "Terraformiac"
  location = "East US"
  resource_group_name = module.ResourceGroup.rg_name_out
}

module "Network" {
  source = "./Network"
  base_name = "Terraformiac"
  resource_group_name = module.ResourceGroup.rg_name_out
  nsg_name = module.Security.nsg_name_out
  nsg_id = module.Security.nsg_id_out
  location = "East US"

}

module "VM" {
  source = "./VM"
  base_name = "Terraformiac"
  resource_group_name = module.ResourceGroup.rg_name_out
  nic_id = module.Network.nic_id
  location = "East US"
}