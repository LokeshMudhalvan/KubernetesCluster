output "ids" {
  value = {
    for k, v in keycloak_user.user : k => v.id
  }
}