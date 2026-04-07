resource "azurerm_resource_group" "resource_group" {
  lifecycle {
    ignore_changes = [
      tags["availability"],
      tags["integrity"],
      tags["confidentiality"],
      tags["traceability"],
      tags["spoke_type"]
    ]
  }

  name     = local.rg_name
  location = var.context.location
  tags     = merge(var.tags, local.default_tags)
}
