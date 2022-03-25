terraform{
    required_providers{
        azurerm = {
            source = "haschicorp/azurerm"
            version = "2.88.1"
        }
    }
}

provider "azurerm" {
    features{
        
    }
}

module "ResourceGroup" {
    source = "./ResourceGroup"
    rgname = "Rampupfinal"
    location = "East US"
}