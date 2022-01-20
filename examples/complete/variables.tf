#cen
variable "cen_name" {
  description = "The name of the CEN instance. Defaults to null. The name must be 2 to 128 characters in length and can contain letters, numbers, periods (.), underscores (_), and hyphens (-). The name must start with a letter, but cannot start with http:// or https://."
  type        = string
  default     = "tf-cen-name"
}

variable "cen_description" {
  description = " The description of the CEN instance. Defaults to null. The description must be 2 to 256 characters in length. It must start with a letter, and cannot start with http:// or https://."
  type        = string
  default     = "cen_description"
}

#bandwidth  package
variable "bandwidth_package_name" {
  description = "The name of the bandwidth package. Defaults to null."
  type        = string
  default     = "tf-bandwidth-package-name"
}

variable "bandwidth" {
  description = "The bandwidth in Mbps of the bandwidth package. Cannot be less than 2Mbps."
  type        = number
  default     = 20
}

variable "banwidth_description" {
  description = "The description of the bandwidth package. Default to null."
  type        = string
  default     = "banwidth_description"
}

variable "payment_type" {
  description = "The billing method. Valid value: PostPaid | PrePaid. Default to PostPaid. If set to PrePaid, the bandwidth package can't be deleted before expired time."
  type        = string
  default     = "PostPaid"
}

variable "period" {
  description = "The purchase period in month. Valid value: 1, 2, 3, 6, 12. Default to 1."
  type        = number
  default     = 1
}

#bandwidth limit
variable "bandwidth_limit" {
  description = " The bandwidth configured for the interconnected regions communication."
  type        = number
  default     = 4
}