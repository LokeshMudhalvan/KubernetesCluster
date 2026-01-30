output "ids" {
  value = {
    for k, v in keycloak_openid_client_scope.openid_client_scope : k => v.id
  }
}

output "client_scope_names" {
  value = keys(var.client_scopes)
}

