resource "azurerm_resource_group" "build_resource_group" {
  name     = var.resource_group_name
  location = "East US"
}
