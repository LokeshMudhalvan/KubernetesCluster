resource "keycloak_openid_client" "openid_client" {
  for_each    = var.clients
  realm_id    = var.realm_id
  client_id   = each.key
  name        = each.value.name
  access_type = each.value.access_type
  enabled     = true
}

