provider "azuread" {
  version = "=0.7.0"
}

provider "random" {
  version = "~>2.2"
}

module "serviceprincipal" {
  source = "./modules/service-principal"
  service_principal_end_data = "2020-12-31T23:59:59Z"
  providers = {
    azuread = azuread
    randon = random
  }
}