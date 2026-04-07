variable "context" {
  description = "Platform context object"
  type = object({
    business        = string
    business_sht    = optional(string)
    application     = string
    application_sht = optional(string)
    environment     = string
    location        = string
    location_sht    = optional(string)
    contract_id     = string
    spoke_type      = string
  })
}

  validation {
    condition     = length(var.instance) >= 2
    error_message = "Instance must be at least 2 characters"
  }
}

