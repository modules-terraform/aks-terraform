resource "azuread_application" "aksadapp" {
  name                       = "aksplayground_sp_tf"
  homepage                   = "https://aksplayground_sp_tf"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
}
