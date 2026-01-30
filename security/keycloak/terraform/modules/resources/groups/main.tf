resource "keycloak_group" "group" {
  for_each = var.groups
  realm_id = var.realm_id
  name     = each.value.name
}

