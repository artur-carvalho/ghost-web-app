terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.98.0"
    }
  }
  #   backend "azurerm" {
  #     subscription_id      = ""
  #     resource_group_name  = ""
  #     storage_account_name = "ccoetfstate"
  #     container_name       = "tfstate"
  #     key                  = "terraform.state"
  #   }
}

provider "azurerm" {
  features {}
}