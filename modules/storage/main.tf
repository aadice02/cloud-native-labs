resource "azurerm_storage_account" "storage" {
name = var.storage_account_name
resource_group_name = azurerm_resource_group.rg.name
location = var.location
account_kind = var.account_kind
account_tier = var.account_tier
account_replication_type = var.account_replication_type

tags = {
environment = "dev"
}
}
