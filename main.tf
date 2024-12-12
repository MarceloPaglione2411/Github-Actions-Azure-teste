terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>3.0"
    }
  }
  backend "azurerm" {
      resource_group_name  = "tfstate"
      storage_account_name = "tfstate26047"
      container_name       = "tfstate"
      key                  = "terraform.tfstate"
  }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "state-demo-secure" {
  name     = "state-demo"
  location = "eastus"
}

#Criação RG
resource "azurerm_resource_group" "mod_resource_group1" {
  name     = var.rs_name
  location = var.rs_location
}

#Criação VNET + SUBNETS
resource "azurerm_virtual_network" "MOD_VNET01" {
  name                = "VNET01"
  location            = var.rs_location
  resource_group_name = var.rs_name
  address_space       = ["10.0.0.0/16"]
  tags = {
    name = "Ambiente"
    environment = "Storage Account"
  }
}

resource "azurerm_subnet" "MOD_SUB-LNX" {
  name                 = "SUB-LNX"
  resource_group_name  = var.rs_name
  virtual_network_name = azurerm_virtual_network.MOD_VNET01.name
  address_prefixes     = ["10.0.1.0/24"]
}
