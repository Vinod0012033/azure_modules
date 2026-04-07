variable "context" {
  description = "Spoke's context object — passed directly to child modules."
  type = object({
    contract_id       = string
    business          = string
    business_tla      = string
    application       = string
    application_tla   = string
    environment       = string
    location          = string
    location_tla      = string
    naming_convention = optional(string, "v1")
  })
}

variable "secrets" {
  description = "Spoke's secrets — passed directly to child modules."
  type = object({
    SERVICE_PRINCIPAL_CLIENT_ID     = optional(string, "")
    SERVICE_PRINCIPAL_CLIENT_SECRET = optional(string, "")
    TENANT_ID                       = optional(string, "")
    SPOKE_SUBSCRIPTION_ID           = optional(string, "")
  })
  sensitive = true
}

variable "instance" {
  description = "Unique identifier for this resource (e.g. '001'). Must be at least 2 alphanumeric characters."
  type        = string
}

variable "tags" {
  description = "Additional business-specific tags. Platform mandatory tags are applied automatically."
  type        = map(any)
  default     = {}
}
