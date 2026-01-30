variable "realm_id" {
  type = string
}

variable "groups" {
  type = map(object({
    name = string
  }))
}
