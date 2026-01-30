output "ids" {
  value = {
    for k, v in keycloak_group.group : k => v.id
  }
}
