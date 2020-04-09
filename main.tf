provider "azurerm" {
    version = "=2.1.0"
    features {}
}

provider "azuread" {
  version = "=0.7.0"
}

provider "random" {
   version= "~>2.2"
}

provider "null" {
   version="=2.1"
}

terraform {
    backend "azurerm" {
        resource_group_name     = "tf-state-group"
        storage_account_name    = "tfstatestrgaccount"
        container_name          = "tfstate"
        key                     = "terraform.tfstate"
    }
}