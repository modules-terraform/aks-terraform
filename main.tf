provider "azurerm" {
    version = "~>1.5"
}

provider "azuread" {
  version = "=0.3.1"
}

terraform {
    backend "azurerm" {
        resource_group_name     = "tf-state-group"
        storage_account_name    = "tfstatestrgaccount"
        container_name          = "tfstate"
        key                     = "terraform.tfstate"
    }
}