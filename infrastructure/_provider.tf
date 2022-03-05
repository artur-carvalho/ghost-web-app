terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">= 2.98.0"
    }
  }
  # backend "azurerm" {
  #   subscription_id      = ""
  #   resource_group_name  = "terraform-backend"
  #   storage_account_name = "echoblogtfstate"
  #   container_name       = "tfstate"
  #   key                  = "terraform.state"
  # }
}

provider "azurerm" {
  features {}
}