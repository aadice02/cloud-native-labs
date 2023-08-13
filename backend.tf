terraform {
  backend "azurerm" {
    resource_group_name   = "ODL-azure-1041010"
    storage_account_name  = "intuitivestg"
    container_name        = "terrafromstatestorage"
    key                   = "terraform.tfstate"
  }
}
