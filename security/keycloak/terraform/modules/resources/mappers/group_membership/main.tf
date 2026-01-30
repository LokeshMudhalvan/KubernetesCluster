resource "keycloak_openid_group_membership_protocol_mapper" "group_membership_mapper" {
  for_each        = var.group_mappings
  realm_id        = var.realm_id
  client_scope_id = var.client_scope_id
  name            = each.value.name
  claim_name      = each.value.claim_name
}
