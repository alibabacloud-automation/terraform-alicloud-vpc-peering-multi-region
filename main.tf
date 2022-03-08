locals {
  cen_id = var.using_existing_cen_id || var.existing_cen_id != "" ? var.existing_cen_id : concat(alicloud_cen_instance.this.*.id, [""])[0]
}

resource "alicloud_cen_instance" "this" {
  count             = var.create_cen ? 1 : 0
  cen_instance_name = var.cen_name
  description       = var.cen_description
}

resource "alicloud_cen_bandwidth_package" "this" {
  count                      = var.create_bandwidth_package ? 1 : 0
  cen_bandwidth_package_name = var.bandwidth_package_name
  bandwidth                  = var.bandwidth
  geographic_region_a_id     = var.geographic_region_a_id != "" ? var.geographic_region_a_id : var.geographic_region_ids[0]
  geographic_region_b_id     = var.geographic_region_b_id != "" ? var.geographic_region_b_id : var.geographic_region_ids[1]
  description                = var.banwidth_description
  payment_type               = var.payment_type != "" ? var.payment_type : var.charge_type
  period                     = var.period
}

resource "alicloud_cen_bandwidth_package_attachment" "this" {
  count                = var.create_bandwidth_package_attachment ? 1 : 0
  instance_id          = local.cen_id
  bandwidth_package_id = var.bandwidth_package_id != "" ? var.bandwidth_package_id : concat(alicloud_cen_bandwidth_package.this.*.id, [""])[0]
}

resource "alicloud_cen_instance_attachment" "vpc_attach_1" {
  count                    = var.create_cen_instance_attachment ? 1 : 0
  instance_id              = local.cen_id
  child_instance_id        = var.vpc_id_1
  child_instance_region_id = var.child_instance_region_id_1
  child_instance_type      = "VPC"
}

resource "alicloud_cen_instance_attachment" "vpc_attach_2" {
  count                    = var.create_cen_instance_attachment ? 1 : 0
  instance_id              = local.cen_id
  child_instance_id        = var.vpc_id_2
  child_instance_region_id = var.child_instance_region_id_2
  child_instance_type      = "VPC"
}

resource "alicloud_cen_bandwidth_limit" "this" {
  count       = var.create_bandwidth_limit ? 1 : 0
  instance_id = var.instance_id != "" ? var.instance_id : local.cen_id
  region_ids = [
    var.child_instance_region_id_1,
  var.child_instance_region_id_2]
  bandwidth_limit = var.bandwidth_limit
}