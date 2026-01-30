output "ids" {
  value = {
    for k, v in keycloak_openid_client.openid_client : k => v.id
  }
}