resource "keycloak_group_memberships" "group_members" {
  for_each = var.groups
  realm_id = var.realm_id
  group_id = each.value.group
  members  = each.value.members
}
