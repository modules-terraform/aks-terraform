provider "azurerm" {
  version = "=2.8.0"
  features {}
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-group"
    storage_account_name = "tfstatestrgaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}