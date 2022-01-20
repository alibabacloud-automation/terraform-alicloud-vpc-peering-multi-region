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

## Usage

```hcl
module "vpc-peering-multi-region" {
  source  = "terraform-alicloud-modules/vpc-peering-multi-region/alicloud"

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
From the version v1.1.0, the module has removed the following `provider` setting:

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/vpc-peering-multi-region"
}
```

If you still want to use the `provider` setting to apply this module, you can specify a supported version, like 1.0.0:

```hcl
module "vpc-peering-multi-region" {
  source          = "terraform-alicloud-modules/vpc-peering-multi-region/alicloud"
  version         = "1.0.0"
  region          = "cn-shanghai"
  profile         = "Your-Profile-Name"
  cen_name        = "your_cen_name"
  cen_description = "terraform cen"
  // ...
}
```

If you want to upgrade the module to 1.1.0 or higher in-place, you can define a provider which same region with
previous region:

```hcl
provider "alicloud" {
  region  = "cn-shanghai"
  profile = "Your-Profile-Name"
}
module "vpc-peering-multi-region" {
  source          = "terraform-alicloud-modules/vpc-peering-multi-region/alicloud"
  cen_name        = "your_cen_name"
  cen_description = "terraform cen"
  // ...
}
```
or specify an alias provider with a defined region to the module using `providers`:

```hcl
provider "alicloud" {
  region  = "cn-shanghai"
  profile = "Your-Profile-Name"
  alias   = "sh"
}
module "vpc-peering-multi-region" {
  source          = "terraform-alicloud-modules/vpc-peering-multi-region/alicloud"
  providers       = {
    alicloud = alicloud.sh
  }
  cen_name        = "your_cen_name"
  cen_description = "terraform cen"
  // ...
}
```

and then run `terraform init` and `terraform apply` to make the defined provider effect to the existing module state.

More details see [How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform versions

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.57.0 |

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
