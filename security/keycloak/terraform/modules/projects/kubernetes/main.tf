module "client" {
  source   = "../../resources/clients"
  realm_id = var.realm_id
  clients = {
    kubernetes = {
      name                = "kubernetes-tf-test"
      access_type         = "PUBLIC"
      valid_redirect_uris = ["http://localhost:8000", "http://localhost:18000"]
    }
  }
  providers = {
    keycloak = keycloak
  }
}

module "groups" {
  source   = "../../resources/groups"
  realm_id = var.realm_id
  groups = {
    clusterAdmin = {
      name = "ClusterAdmin"
    }
    podViewer = {
      name = "PodViewer"
    }
  }
  providers = {
    keycloak = keycloak
  }
}

module "users" {
  source   = "../../resources/users"
  realm_id = var.realm_id
  users = {
    admin = {
      email            = "admin@test.com"
      enabled          = true
      initial_password = "CHANGEME!"
    }
    restricted-user = {
      email            = "restricted@test.com"
      enabled          = true
      initial_password = "CHANGEME!"
    }
  }
  providers = {
    keycloak = keycloak
  }
}

module "group_users" {
  source   = "../../resources/user_groups"
  realm_id = var.realm_id
  groups = {
    clusterAdmin = {
      group   = module.groups.ids["clusterAdmin"]
      members = ["admin"]
    }
    podViewer = {
      group   = module.groups.ids["podViewer"]
      members = ["restricted-user"]
    }
  }
  providers = {
    keycloak = keycloak
  }
}

module "client_scopes" {
  source   = "../../resources/client-scope"
  realm_id = var.realm_id
  client_scopes = {
    name = {
      description = "This contains user names"
    }
    groups = {
      description = "This contains user group"
    }
  }
  providers = {
    keycloak = keycloak
  }
}

module "user_attribute_mappers" {
  source          = "../../resources/mappers/user_attribute"
  realm_id        = var.realm_id
  client_scope_id = module.client_scopes.ids["name"]
  user_attribute_map = {
    name = {
      name           = "name"
      claim_name     = "name"
      user_attribute = "username"
    }
  }
  providers = {
    keycloak = keycloak
  }
}

module "group_membership_mappers" {
  source          = "../../resources/mappers/group_membership"
  realm_id        = var.realm_id
  client_scope_id = module.client_scopes.ids["groups"]
  group_mappings = {
    groups = {
      name             = "groups"
      claim_name       = "groups"
      enable_full_path = false
    }
  }
  providers = {
    keycloak = keycloak
  }
}

module "default_client_scopes" {
  source         = "../../resources/client-default-scopes"
  realm_id       = var.realm_id
  client_id      = module.client.ids["kubernetes"]
  default_scopes = module.client_scopes.client_scope_names

  providers = {
    keycloak = keycloak
  }
}

