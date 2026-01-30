terraform {
  required_providers {
    keycloak = {
      source  = "mrparkers/keycloak"
      version = "~> 4.4"
    }
  }
}

provider "keycloak" {
  client_id = var.keycloak_client_id
  username  = var.username
  password  = var.password
  url       = var.keycloak_url
  realm     = "master"
}
