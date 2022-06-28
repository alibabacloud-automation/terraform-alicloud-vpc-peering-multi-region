provider "alicloud" {
  alias  = "bj"
  region = "cn-beijing"
}

provider "alicloud" {
  alias  = "hz"
  region = "cn-hangzhou"
}

resource "alicloud_vpc" "vpc1" {
  provider   = alicloud.bj
  cidr_block = "172.16.0.0/12"
}

resource "alicloud_vpc" "vpc2" {
  provider   = alicloud.hz
  cidr_block = "172.16.0.0/16"
}

module "cen" {
  source = "../.."

  #cen
  create_cen = true

  cen_name        = var.cen_name
  cen_description = var.cen_description

  #bandwidth  package
  create_bandwidth_package = false

  #bandwidth  package attachment
  create_bandwidth_package_attachment = false

  #cen instance attachment
  create_cen_instance_attachment = false

  #bandwidth limit
  create_bandwidth_limit = false

}

module "bandwidth_package" {
  source = "../.."

  #cen
  create_cen = false

  #bandwidth  package
  create_bandwidth_package = true

  bandwidth_package_name = var.bandwidth_package_name
  bandwidth              = var.bandwidth
  geographic_region_a_id = "China"
  geographic_region_b_id = "China"
  banwidth_description   = var.banwidth_description
  payment_type           = var.payment_type
  period                 = var.period

  #bandwidth  package attachment
  create_bandwidth_package_attachment = false

  #cen instance attachment
  create_cen_instance_attachment = false

  #bandwidth limit
  create_bandwidth_limit = false

}

module "bandwidth_package_attachment" {
  source = "../.."

  #cen
  create_cen = false

  #bandwidth  package
  create_bandwidth_package = false

  #bandwidth  package attachment
  create_bandwidth_package_attachment = true

  using_existing_cen_id = true
  existing_cen_id       = module.cen.this_cen_id
  bandwidth_package_id  = module.bandwidth_package.this_bandwidth_package_id

  #cen instance attachment
  create_cen_instance_attachment = false

  #bandwidth limit
  create_bandwidth_limit = false

}

module "cen_instance_attachment" {
  source = "../.."

  #cen
  create_cen = false

  #bandwidth  package
  create_bandwidth_package = false

  #bandwidth  package attachment
  create_bandwidth_package_attachment = false

  #cen instance attachment
  create_cen_instance_attachment = true

  using_existing_cen_id      = true
  existing_cen_id            = module.cen.this_cen_id
  vpc_id_1                   = alicloud_vpc.vpc1.id
  child_instance_region_id_1 = "cn-beijing"
  vpc_id_2                   = alicloud_vpc.vpc2.id
  child_instance_region_id_2 = "cn-hangzhou"

  #bandwidth limit
  create_bandwidth_limit = false

}

module "bandwidth_limit" {
  source = "../.."

  #cen
  create_cen = false

  #bandwidth  package
  create_bandwidth_package = false

  #bandwidth  package attachment
  create_bandwidth_package_attachment = false

  #cen instance attachment
  create_cen_instance_attachment = false

  #bandwidth limit
  create_bandwidth_limit = true

  instance_id                = module.bandwidth_package_attachment.this_cen_bandwidth_package_attachment_instance_id
  child_instance_region_id_1 = module.cen_instance_attachment.this_cen_instance_attachment_region_id[0]
  child_instance_region_id_2 = module.cen_instance_attachment.this_cen_instance_attachment_region_id[1]
  bandwidth_limit            = var.bandwidth_limit

}