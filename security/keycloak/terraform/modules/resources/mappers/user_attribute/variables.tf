variable "realm_id" {
  type = string
}

variable "client_scope_id" {
  type = string
}

variable "user_attribute_map" {
  type = map(object({
    name           = string
    claim_name     = string
    user_attribute = string
  }))
}
