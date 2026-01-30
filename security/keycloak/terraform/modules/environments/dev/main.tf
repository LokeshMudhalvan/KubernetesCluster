module "realm" {
  source     = "../../resources/realms"
  realm_name = "platform-dev"
  providers = {
    keycloak = keycloak
  }
}

module "kubernetes" {
  source   = "../../projects/kubernetes"
  realm_id = module.realm.id
  providers = {
    keycloak = keycloak
  }
}
