
#cen
output "this_cen_id" {
  description = "The ID of the CEN instance."
  value       = module.vpc-peering-multi-region.this_cen_id
}

output "this_cen_name" {
  description = "The name of the CEN instance."
  value       = module.vpc-peering-multi-region.this_cen_name
}

output "this_cen_description" {
  description = "The description of the CEN instance."
  value       = module.vpc-peering-multi-region.this_cen_description
}

#bandwidth package
output "this_bandwidth_package_id" {
  description = "The bandwidth package id."
  value       = module.vpc-peering-multi-region.this_bandwidth_package_id

}

#attachment
output "this_cen_instance_attachment_id" {
  description = "ID of the resource, formatted as <instance_id>:<child_instance_id>."
  value       = module.vpc-peering-multi-region.this_cen_instance_attachment_id
}

#limit
output "this_cen_bandwidth_limit_id" {
  description = "ID of the resource, formatted as <instance_id>:<region_id_1>:<region_id_2>."
  value       = module.vpc-peering-multi-region.this_cen_bandwidth_limit_id
}