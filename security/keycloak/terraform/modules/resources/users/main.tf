
resource "keycloak_user" "user" {
  for_each = var.users
  realm_id = var.realm_id
  username = each.key
  email    = lookup(each.value, "email", null)
  enabled  = each.value.enabled

  required_actions = ["UPDATE_PASSWORD"]

  initial_password {
    value     = each.value.initial_password
    temporary = true
  }
}

