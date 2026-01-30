variable "keycloak_url" {
  type = string
}

variable "keycloak_client_id" {
  type = string
}

variable "username" {
  type = string
}

variable "password" {
  type      = string
  sensitive = true
}

