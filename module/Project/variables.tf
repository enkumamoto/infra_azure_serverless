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
