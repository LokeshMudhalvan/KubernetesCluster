variable "realm_id" {
  type = string
}

variable "groups" {
  type = map(object({
    group   = string
    members = list(string)
  }))
}
