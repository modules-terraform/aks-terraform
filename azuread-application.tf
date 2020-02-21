resource "azuread_application" "aksadapp" {
  name                       = "aksplayground_sp_tf"
  homepage                   = "https://aksplayground_sp_tf"
  available_to_other_tenants = false
  oauth2_allow_implicit_flow = false
}

resource "azuread_service_principal" "aksadsp" {
  application_id = azuread_application.aksadapp.application_id
}

resource "azuread_service_principal_password" "example" {
  service_principal_id = "${azuread_service_principal.aksadsp.id}"
  value                = "VT=uSgbTanZhyz@%nL9Hpd+Tfay_MRV#"
  end_date             = "2020-12-31T23:59:59Z"
}