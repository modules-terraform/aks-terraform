resource "azuread_application" "aksadapp" {
  # name                       = "aksplayground_sp_tf"
  name                       = var.name
  # homepage                   = "https://aksplayground_sp_tf"
  homepage                   = "https://${var.name}"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
}
