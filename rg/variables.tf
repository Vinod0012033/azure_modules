variable "context" {
  description = "Platform context object"
  type = object({
    business            = string
    business_sht        = string
    application         = string
    application_sht     = string
    environment         = string
    location            = string
    location_sht        = string
    contract_id         = string
    spoke_type          = string
  })
}

variable "instance" {
  description = "Unique identifier (01, 02...)"
  type        = string

  validation {
    condition     = length(var.instance) >= 2
    error_message = "Instance must be at least 2 characters"
  }
}

variable "tags" {
  type    = map(string)
  default = {}
}