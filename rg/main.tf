resource "azurerm_resource_group" "rg" {
 
 lifecycle {
   precondition {
    condition = (local.resource_group_name <= 90)
    error_message = "Resource group name must be 90 characters or less to comply with Azure"
     
   }
   
   precondition {
    condition = contains(["dev", "qa", "prod"], lower(var.context.environment))
    error_message = "Environment must be one of 'dev', 'qa', or 'prod'"
    }
 }
 name     = local.resource_group_name
 location = var.context.location

 tags     = local.default_tags
}