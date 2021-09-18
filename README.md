Terraform module to create a peering connection between two VPCs in the same Alibaba Cloud account and multi region.  
terraform-alicloud-vpc-peering-multi-region
---------------------

English | [简体中文](https://github.com/terraform-alicloud-modules/terraform-alicloud-vpc-peering-multi-region/blob/master/README-CN.md)

Terraform module which create a peering connection between two VPCs in the same Alibaba Cloud account and multi region.

These types of resources are supported:

* [alicloud_cen_instance](https://www.terraform.io/docs/providers/alicloud/r/cen_instance.html)
* [alicloud_cen_instance_attachment](https://www.terraform.io/docs/providers/alicloud/r/cen_instance_attachment.html)
* [alicloud_cen_bandwidth_limit](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_limit.html)
* [alicloud_cen_bandwidth_package](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_package.html)
* [alicloud_cen_bandwidth_package_attachment](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_package_attachment.html)


## Terraform versions

This module requires Terraform 0.12 and Terraform Provider AliCloud 1.57.0+.

## Usage

```hcl
module "vpc-peering-multi-region" {
  source  = "terraform-alicloud-modules/vpc-peering-multi-region/alicloud"
  region   = "cn-shanghai"                
  profile  = "Your-Profile-Name"

  #cen
  cen_name        = "your_cen_name"
  cen_description = "terraform cen"

  #attachment
  vpc_id_1                   = "vpc-bp1kizrg24e9nxxxxxx"
  vpc_id_2                   = "vpc-dbl7ksd7a7d89nxxxxx"
  child_instance_region_id_1 = "cn-hangzhou"
  child_instance_region_id_2 = "cn-shanghai"

  #bandwidth
  bandwidth_package_name = "tf-testAccCenBandwidthPackageConfig"
  bandwidth              = 5
  geographic_region_ids = ["China", "China"]
}
```

## Examples

* [complete](https://github.com/terraform-alicloud-modules/terraform-alicloud-vpc-peering-multi-region/tree/master/examples/complete)

## Notes

* This module using AccessKey and SecretKey are from `profile` and `shared_credentials_file`.
If you have not set them yet, please install [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) and configure it.

Submit Issues
-------------
If you have any problems when using this module, please opening a [provider issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new) and let us know.

**Note:** There does not recommend to open an issue on this repo.

Authors
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

License
----
Apache 2 Licensed. See LICENSE for full details.

Reference
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
