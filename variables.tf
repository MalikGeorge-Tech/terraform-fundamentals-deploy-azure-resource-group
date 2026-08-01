variable "resource_group_name" {
  description = "Name of the Azure resource group to create."
  type        = string
  default     = "rg-terraform-fundamentals"
}

variable "location" {
  description = "Azure region where the resource group will be created."
  type        = string
  default     = "uksouth"
}

variable "tags" {
  description = "Tags applied to the resource group."
  type        = map(string)
  default = {
    environment = "learning"
    project     = "terraform-fundamentals"
  }
}