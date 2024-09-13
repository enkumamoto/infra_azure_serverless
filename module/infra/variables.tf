# Basics Variables
variable "rg_name" {
  type = string
}

variable "project_alias" {
  type = string
}

variable "location" {
  type = string
}

variable "environment" {
  type = string
  validation {
    condition     = var.environment == "production" || var.environment == "staging" || var.environment == "sandbox"
    error_message = "Environment must be either production, staging, or sandbox"
  }
}

# Storage Variables
variable "os_type" {
  type    = string
  default = "Linux"
}

variable "service_plan" {
  type = string
}

variable "service_plan_sku_name" {
  type    = string
  default = "P1v2"
}

variable "sku_tier" {
  type    = string
  default = "Standard"
}

variable "account_replication_type" {
  type    = string
  default = "LRS"
}

variable "storacc_name" {
  type = string
}
