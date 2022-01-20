#cen
output "this_cen_id" {
  description = "The ID of the CEN instance."
  value       = concat(alicloud_cen_instance.this.*.id, [""])[0]
}

output "this_cen_name" {
  description = "The name of the CEN instance."
  value       = concat(alicloud_cen_instance.this.*.name, [""])[0]
}

output "this_cen_description" {
  description = "The description of the CEN instance."
  value       = concat(alicloud_cen_instance.this.*.description, [""])[0]
}

#bandwidth package
output "this_bandwidth_package_id" {
  description = "The bandwidth package id."
  value       = concat(alicloud_cen_bandwidth_package.this.*.id, [""])[0]
}

#bandwidth  package attachment
output "this_cen_bandwidth_package_attachment_instance_id" {
  description = "The ID of the CEN instance."
  value       = concat(alicloud_cen_bandwidth_package_attachment.this.*.instance_id, [""])[0]
}

#cen instance attachment
output "this_cen_instance_attachment_id" {
  description = " ID of the resource, It is formatted to <instance_id>:<child_instance_id>:<child_instance_type>:<child_instance_region_id>."
  value       = [concat(alicloud_cen_instance_attachment.vpc_attach_1.*.id, [""])[0], concat(alicloud_cen_instance_attachment.vpc_attach_2.*.id, [""])[0]]
}

output "this_cen_instance_attachment_region_id" {
  description = "The region ID of the resource."
  value       = [concat(alicloud_cen_instance_attachment.vpc_attach_1.*.child_instance_region_id, [""])[0], concat(alicloud_cen_instance_attachment.vpc_attach_2.*.child_instance_region_id, [""])[0]]
}

#limit
output "this_cen_bandwidth_limit_id" {
  description = "ID of the resource, formatted as <instance_id>:<region_id_1>:<region_id_2>."
  value       = concat(alicloud_cen_bandwidth_limit.this.*.id, [""])[0]
}