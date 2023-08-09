provider "azurerm" {
  features {}
}

module "resourcegroup" {
  source         = "./modules/resourcegroup"
  name           = var.name
  location       = var.location
}

module "networking" {
  source         = "./modules/networking"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  vnetcidr       = var.vnetcidr
  websubnetcidr  = var.websubnetcidr
}

module "securitygroup" {
  source         = "./modules/securitygroup"
  location       = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name 
  web_subnet_id  = module.networking.websubnet_id
}

module "compute" {
  source         = "./modules/compute"
  password_length = 16
  location = module.resourcegroup.location_id
  resource_group = module.resourcegroup.resource_group_name
  web_subnet_id = module.networking.websubnet_id
  web_host_name = var.web_host_name
  web_username = var.web_username
}

module "azure_storage_account" {
source = "./modules/storage"
resource_group_name = module.resourcegroup.resource_group_name
storage_account_name = var.storage_account_name
location = module.resourcegroup.location_id
account_kind = var.account_kind
account_tier = var.account_tier
account_replication_type = var.account_replication_type
}
