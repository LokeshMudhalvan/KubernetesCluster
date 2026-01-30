output "ids" {
  value = {
    for k, v in keycloak_group_memberships.group_members : k => v.id
  }
}
