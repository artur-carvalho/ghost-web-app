terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.98.0"
    }
  }
  backend "azurerm" {
    subscription_id      = "2a30ecb6-4675-400e-9599-90e6ff348242"
    resource_group_name  = "terraform-backend"
    storage_account_name = "pocghosttfstate"
    container_name       = "tfstate"
    key                  = "terraform.state"
  }
}

provider "azurerm" {
  features {}
}