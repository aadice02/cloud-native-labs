terraform {
  backend "azurerm" {
    resource_group_name   = "ODL-azure-971911"
    storage_account_name  = "terraformstatestg123"
    container_name        = "terrafromstatestorage"
    key                   = "terraform.tfstate"
  }
}
