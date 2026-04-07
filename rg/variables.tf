variable "context" {
  type = object({
    business             = string
    business_tla         = string
    application          = string
    application_tla      = string
    environment          = string
    location             = string
    location_tla         = string
    contract_id          = string
    spoke_type           = string
    naming_convention    = string 
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
