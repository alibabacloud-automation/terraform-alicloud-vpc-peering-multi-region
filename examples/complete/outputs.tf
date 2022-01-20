#cen
output "this_cen_id" {
  description = "The ID of the CEN instance."
  value       = module.cen.this_cen_id
}

output "this_cen_name" {
  description = "The name of the CEN instance."
  value       = module.cen.this_cen_name
}

output "this_cen_description" {
  description = "The description of the CEN instance."
  value       = module.cen.this_cen_description
}

#bandwidth package
output "this_bandwidth_package_id" {
  description = "The bandwidth package id."
  value       = module.bandwidth_package.this_bandwidth_package_id
}

#bandwidth  package attachment
output "this_cen_bandwidth_package_attachment_instance_id" {
  description = "The ID of the CEN instance."
  value       = module.bandwidth_package_attachment.this_cen_bandwidth_package_attachment_instance_id
}

#cen instance attachment
output "this_cen_instance_attachment_id" {
  description = " ID of the resource, It is formatted to <instance_id>:<child_instance_id>:<child_instance_type>:<child_instance_region_id>."
  value       = module.cen_instance_attachment.this_cen_instance_attachment_id
}

output "this_cen_instance_attachment_region_id" {
  description = "The region ID of the resource."
  value       = module.cen_instance_attachment.this_cen_instance_attachment_region_id
}

#limit
output "this_cen_bandwidth_limit_id" {
  description = "ID of the resource, formatted as <instance_id>:<region_id_1>:<region_id_2>."
  value       = module.bandwidth_limit.this_cen_bandwidth_limit_id
}