resource "azuread_service_principal" "aksadsp" {
  application_id = azuread_application.aksadapp.application_id
  tags = concat(
    ["terraform"],
    [var.name],
    var.custom_tags
  )
}
