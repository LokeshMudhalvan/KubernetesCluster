variable "realm_id" {
  type = string
}

variable "client_scopes" {
  type = map(object({
    description = string 
  }))
}