variable "region" {
  description = "The region used to launch this module resources."
  type        = string
  default     = ""
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If not set, it will be sourced from the ALICLOUD_PROFILE environment variable."
  type        = string
  default     = ""
}
variable "shared_credentials_file" {
  description = "This is the path to the shared credentials file. If this is not set and a profile is specified, $HOME/.aliyun/config.json will be used."
  type        = string
  default     = ""
}

variable "skip_region_validation" {
  description = "Skip staticvalidation of region ID. Used by users of alternative AlibabaCloud-like APIs or users w/ access to regions that are not public (yet)."
  type        = bool
  default     = false
}

#cen
variable "create_cen" {
  description = "Whether to create cen. If false, you can specify an existing cen by setting 'cen_id'."
  type        = bool
  default     = true
}

variable "using_existing_cen_id" {
  description = "Whether to create instance. If false, you can specify an existing cen instance."
  type        = bool
  default     = false
}

variable "existing_cen_id" {
  description = "The cen id used to launch several vswitches. If set, the 'create_cen' will be ignored."
  type        = string
  default     = ""
}

variable "cen_name" {
  description = "The name of the CEN instance. Defaults to null. The name must be 2 to 128 characters in length and can contain letters, numbers, periods (.), underscores (_), and hyphens (-). The name must start with a letter, but cannot start with http:// or https://."
  type        = string
  default     = ""
}

variable "cen_description" {
  description = " The description of the CEN instance. Defaults to null. The description must be 2 to 256 characters in length. It must start with a letter, and cannot start with http:// or https://."
  type        = string
  default     = ""
}

variable "vpc_id_1" {
  description = "The vpc id."
  type        = string
  default     = ""
}

variable "vpc_id_2" {
  description = "The vpc id."
  type        = string
  default     = ""
}

#bandwidth  package
variable "create_bandwidth_package" {
  description = "Whether to create bandwidth package."
  type        = bool
  default     = true
}

variable "bandwidth_package_name" {
  description = "The name of the bandwidth package. Defaults to null."
  type        = string
  default     = null
}

variable "bandwidth" {
  description = "The bandwidth in Mbps of the bandwidth package. Cannot be less than 2Mbps."
  type        = number
  default     = 10
}

variable "geographic_region_ids" {
  description = "List of the two areas to connect. Valid value: China | North-America | Asia-Pacific | Europe | Middle-East."
  type        = set(string)
  default     = []
}

variable "banwidth_description" {
  description = "The description of the bandwidth package. Default to null."
  type        = string
  default     = "null"
}

variable "charge_type" {
  description = "The billing method. Valid value: PostPaid | PrePaid. Default to PostPaid. If set to PrePaid, the bandwidth package can't be deleted before expired time."
  type        = string
  default     = "PostPaid"
}

variable "period" {
  description = "The purchase period in month. Valid value: 1, 2, 3, 6, 12. Default to 1."
  type        = number
  default     = 1
}

#attachment
variable "create_bandwidth_package_attachment" {
  description = "Wether to create bandwidth package attachment,Default to true."
  type        = bool
  default     = true
}

variable "create_cen_instance_attachment" {
  description = "Wether to create bandwidth package attachment,Default to true."
  type        = bool
  default     = true
}

variable "child_instance_region_id_1" {
  description = "The region ID of the child instance to attach."
  type        = string
  default     = ""
}

variable "child_instance_region_id_2" {
  description = "The region ID of the child instance to attach."
  type        = string
  default     = ""
}

#bandwidth limit
variable "create_bandwidth_limit" {
  description = "Wether to create bandwidth limit,Default to true."
  type        = bool
  default     = true
}

variable "bandwidth_limit" {
  description = " The bandwidth configured for the interconnected regions communication."
  type        = number
  default     = 4
}

variable "child_instance_type" {
  description = "The type of the associated network."
  type        = string
  default     = "VPC"
}
