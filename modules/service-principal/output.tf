output "application_id" {
  value = azuread_service_principal.aksadsp.application_id
}

output "password" {
  value = random_string.password.result
}

output "service_principal_application_id" {
    value = azuread_service_principal.aksadsp.id
}