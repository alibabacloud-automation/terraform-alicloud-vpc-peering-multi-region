
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
  value       = alicloud_cen_instance.this.*.description
}

#bandwidth package
output "this_bandwidth_package_id" {
  description = "The bandwidth package id."
  value       = concat(alicloud_cen_bandwidth_package.this.*.id,[""])[0]
}

#attachment
output "this_cen_instance_attachment_id" {
  description = "ID of the resource, formatted as <instance_id>:<child_instance_id>."
  value       = [alicloud_cen_instance_attachment.vpc_attach_1.*.id,alicloud_cen_instance_attachment.vpc_attach_2.*.id]
}

#limit
output "this_cen_bandwidth_limit_id" {
  description = "ID of the resource, formatted as <instance_id>:<region_id_1>:<region_id_2>."
  value       = alicloud_cen_bandwidth_limit.this.*.id
}