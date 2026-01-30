resource "keycloak_openid_client_scope" "openid_client_scope" {
  for_each    = var.client_scopes
  realm_id    = var.realm_id
  name        = each.key
  description = each.value.description
}

