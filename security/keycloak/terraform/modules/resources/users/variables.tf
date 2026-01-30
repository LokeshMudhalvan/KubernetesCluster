variable "realm_id" {
  type = string
}

variable "users" {
  type = map(object({
    email            = optional(string)
    enabled          = bool
    initial_password = string
  }))
}

