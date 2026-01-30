variable "realm_id" {
  type = string
}

variable "clients" {
  type = map(object({
    name        = string
    access_type = string
  }))

  validation {
    condition = alltrue([
      for c in values(var.clients) :
      contains(["PUBLIC", "CONFIDENTIAL", "BEARER-ONLY"], c.access_type)
    ])
    error_message = "Invalid config: client access type is invalid. It must be either 'CONFIDENTIAL', 'PUBLIC' or 'BEARER-ONLY'"

  }
}
