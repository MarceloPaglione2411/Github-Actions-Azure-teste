 terraform {
 backend "azurerm" {
    resource_group_name  = "rg-state-remote"
    storage_account_name = "srstateremote"
    container_name       = "terraform"
    key                  = "terraform.tfstate"
    access_key           = "MVcSLkFdghawzjV5T9xfzmCEiQhmL0iAR9VjkT9ZhXbGxriU/0H69XY730JspKqC8hsAvCnFxEz8+ASt7zGQyg=="
  }
}


#Criação RG
resource "azurerm_resource_group" "mod_resource_group1" {
  name     = "marcelofile2"
  location = "eastus"
}

#Criação VNET + SUBNETS
resource "azurerm_virtual_network" "MOD_VNET01" {
  name                = "VNET01"
  location            = "eastus"
  resource_group_name = "marcelofile2"
  address_space       = ["10.0.0.0/16"]
}
