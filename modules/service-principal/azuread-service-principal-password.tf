resource "random_string" "password" {
  length = 32
}

resource "azuread_service_principal_password" "akssppass" {
  service_principal_id = azuread_service_principal.aksadsp.id
  value                = random_string.password.result
  end_date             = var.service_principal_end_data
  provisioner "local-exec" {
    command = "sleep 120"
  }
}
