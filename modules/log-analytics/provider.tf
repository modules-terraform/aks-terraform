terraform {
    required_providers {
        azurerm = {
            source = "hashicorp/azurerm"
            version = "2.29.0"
        }
    }
}

provider "azurerm" {
  features {}
}