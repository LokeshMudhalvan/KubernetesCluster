output "clients" {
  description = "Keycloak client IDs created for this project"
  value       = module.client.ids
}

output "groups" {
  description = "Keycloak group IDs created for this project"
  value       = module.groups.ids
}

output "users" {
  description = "Keycloak user IDs created for this project"
  value       = module.users.ids
}

output "client_scopes" {
  description = "Client scope IDs created for this project"
  value       = module.client_scopes.ids
}
