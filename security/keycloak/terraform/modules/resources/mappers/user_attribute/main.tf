resource "keycloak_openid_user_attribute_protocol_mapper" "user_attribute_mapper" {
  for_each        = var.user_attribute_map
  realm_id        = var.realm_id
  client_scope_id = var.client_scope_id
  name            = each.value.name
  claim_name      = each.value.claim_name
  user_attribute  = each.value.user_attribute
}
