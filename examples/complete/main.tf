variable "profile" {
  default = "default"
}
variable "region" {
  default = "cn-shanghai"
}

provider "alicloud" {
  region  = var.region
  profile = var.profile
}

variable "child_instance_region_id_1" {
  default = "cn-hangzhou"
}

variable "child_instance_region_id_2" {
  default = "cn-shanghai"
}

provider "alicloud" {
  alias  = "fra"
  region = var.child_instance_region_id_1
}

provider "alicloud" {
  alias  = "sh"
  region = var.child_instance_region_id_2
}

resource "alicloud_vpc" "vpc1" {
  provider   = "alicloud.fra"
  name       = "vpc1"
  cidr_block = "192.168.0.0/16"
}

resource "alicloud_vpc" "vpc2" {
  provider   = "alicloud.sh"
  name       = "vpc2"
  cidr_block = "172.16.0.0/12"
}
module "vpc-peering-multi-region" {
  source  = "../.."
  region  = var.region
  profile = var.profile

  #cen
  cen_name        = "your_cen_name"
  cen_description = "terraform cen"

  #attachment
  vpc_id_1                   = alicloud_vpc.vpc1.id
  vpc_id_2                   = alicloud_vpc.vpc2.id
  child_instance_region_id_1 = var.child_instance_region_id_1
  child_instance_region_id_2 = var.child_instance_region_id_2

  #bandwidth
  bandwidth_package_name = "tf-testAccCenBandwidthPackageConfig"
  bandwidth              = 5
  geographic_region_ids  = ["China", "China"]
}