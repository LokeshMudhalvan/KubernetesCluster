variable "realm_id" {
  type = string
}

variable "client_scope_id" {
  type = string
}

variable "group_mappings" {
  type = map(object({
    name       = string
    claim_name = string
  }))
}
