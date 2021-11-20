terraform {
    required_providers {
        azuread = {
            source  = "hashicorp/azuread"
            version = "=1.6.0"
        }
        random = {
            source = "hashicorp/random"
            version = "~>2.2"
        }
    }
}