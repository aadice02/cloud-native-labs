variable "rg_name" {
description = "Name of the resource group where the storage account will be created."
type = string
}

variable "storage_account_name" {
description = "Name of the storage account."
type = string
}

variable "location" {
description = "Azure region where the storage account will be located."
type = string
}

variable "account_kind" {
description = "Kind of storage account (StorageV2, BlobStorage, etc.)."
type = string
default = "StorageV2"
}

variable "account_tier" {
description = "Performance tier for the storage account (Standard or Premium)."
type = string
default = "Standard"
}

variable "account_replication_type" {
description = "Replication type for the storage account (LRS, GRS, etc.)."
type = string
default = "LRS"
}
