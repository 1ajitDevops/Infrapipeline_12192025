terraform {
 
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "4.51.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "7617312b-3d00-4f61-9fd7-4380615857ab"
}