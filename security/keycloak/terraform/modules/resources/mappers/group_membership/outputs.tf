output "ids" {
  value = { for k, v in keycloak_openid_group_membership_protocol_mapper.group_membership_mapper : k => v.id }
}
