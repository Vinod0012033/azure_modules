locals {
  module_metadata = jsondecode(file("${path.module}/module.json"))

  default_tags = {
    contract_id    = var.context.contract_id
    business       = var.context.business
    application    = var.context.application
    location       = var.context.location
    environment    = var.context.environment
    module_name    = local.module_metadata.name
    module_version = local.module_metadata.version
  }

  naming_convention_blocks = {
    tla = {
      dashes    = "${var.context.business_tla}-${var.context.application_tla}-${var.context.environment}-${var.context.location_tla}"
      no_dashes = "${var.context.business_tla}${var.context.application_tla}${var.context.environment}${var.context.location_tla}"
    }
    full = {
      dashes    = "${var.context.business}-${var.context.application}-${var.context.environment}-${var.context.location}"
      no_dashes = "${var.context.business}${var.context.application}${var.context.environment}${var.context.location}"
    }
  }

  # v1 = full names, v2 = TLA-based short names
  naming_convention_versions = {
    v1 = {
      rg_name = "rg-${local.naming_convention_blocks.full.dashes}-${var.instance}"
    }
    v2 = {
      rg_name = "rg-${local.naming_convention_blocks.tla.dashes}-${var.instance}"
    }
  }

  naming_convention = local.naming_convention_versions[var.context.naming_convention]
  rg_name           = local.naming_convention.rg_name
}
