locals {
    module_metadata = jsondecode(file("${path.module}/metadata.json"))

    naming_convention_blocks = {
        sht = {
            dashes = "$(var.context.business_sht)-$(var.context.application_sht)-$(var.context.environment)-$(var.context.location_sht)"
            no_dashes = "$(var.context.business_sht)$(var.context.application_sht)$(var.context.environment)$(var.context.location_sht)"
        }

        full = {
            dashes = "$(var.context.business)-$(var.context.application)-$(var.context.environment)-$(var.context.location)"
            no_dashes = "$(var.context.business)$(var.context.application)$(var.context.environment)$(var.context.location)"
        }
    }
    resource_group_name = "rg-${local.naming_convention_blocks.dashes}-${var.instance}"

    default_tags = {
        "Business" = var.context.business
        "Application" = var.context.application
        "Environment" = var.context.environment
        "Location" = var.context.location
        "ContractId" = var.context.contract_id
        "SpokeType" = var.context.spoke_type
    }
}