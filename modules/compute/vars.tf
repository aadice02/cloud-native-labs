variable "resource_group" {}
variable "location" {}
variable "web_subnet_id" {}
variable "web_host_name"{}
variable "web_username" {}
variable "password_length" {
description = "Length of the random password"
type = number
default = 16
}
