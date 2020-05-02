provider "azurerm" {
  version = "=2.6.0"
  features {}
}

provider "null" {
  version = "=2.1"
}

terraform {
  backend "azurerm" {
    resource_group_name  = "tf-state-group"
    storage_account_name = "tfstatestrgaccount"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}