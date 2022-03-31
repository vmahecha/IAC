variable "base_name" {
    type = string
    description = "The base of the name for the vnet"
}

variable "location" {
    type = string
    description = "The location for the deployment"
}

variable "resource_group_name" {
    type = string
    description = "Name of the resource group"
}

variable "nsg_name" {
    type = string
    description = "Name of the nsg"
}

variable "nsg_id" {
    type = string
    description = "ID of the nsg"
}