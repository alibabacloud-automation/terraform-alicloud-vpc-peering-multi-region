terraform-alicloud-vpc-peering-multi-region
=====================================================================

本 Terraform 模块可在同一个阿里云帐户和多区域中的两个VPC之间创建对等连接。

本 Module 支持创建以下资源:

* [alicloud_cen_instance](https://www.terraform.io/docs/providers/alicloud/r/cen_instance.html)
* [alicloud_cen_instance_attachment](https://www.terraform.io/docs/providers/alicloud/r/cen_instance_attachment.html)
* [alicloud_cen_bandwidth_limit](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_limit.html)
* [alicloud_cen_bandwidth_package](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_package.html)
* [alicloud_cen_bandwidth_package_attachment](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_package_attachment.html)

## 用法

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

## 示例

* [创建vpc-peering-multi-region 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-vpc-peering-multi-region/tree/master/examples/complete)

## 注意事项
本Module从版本v1.1.0开始已经移除掉如下的 provider 的显式设置：

```hcl
provider "alicloud" {
  profile                 = var.profile != "" ? var.profile : null
  shared_credentials_file = var.shared_credentials_file != "" ? var.shared_credentials_file : null
  region                  = var.region != "" ? var.region : null
  skip_region_validation  = var.skip_region_validation
  configuration_source    = "terraform-alicloud-modules/vpc-peering-multi-region"
}
```

如果你依然想在Module中使用这个 provider 配置，你可以在调用Module的时候，指定一个特定的版本，比如 1.0.0:

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

如果你想对正在使用中的Module升级到 1.1.0 或者更高的版本，那么你可以在模板中显式定义一个相同Region的provider：
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
或者，如果你是多Region部署，你可以利用 `alias` 定义多个 provider，并在Module中显式指定这个provider：

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

定义完provider之后，运行命令 `terraform init` 和 `terraform apply` 来让这个provider生效即可。

更多provider的使用细节，请移步[How to use provider in the module](https://www.terraform.io/docs/language/modules/develop/providers.html#passing-providers-explicitly)

## Terraform 版本

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_alicloud"></a> [alicloud](#requirement\_alicloud) | >= 1.57.0 |

提交问题
------
如果在使用该 Terraform Module 的过程中有任何问题，可以直接创建一个 [Provider Issue](https://github.com/terraform-providers/terraform-provider-alicloud/issues/new)，我们将根据问题描述提供解决方案。

**注意:** 不建议在该 Module 仓库中直接提交 Issue。

作者
-------
Created and maintained by Alibaba Cloud Terraform Team(terraform@alibabacloud.com)

许可
----
Apache 2 Licensed. See LICENSE for full details.

参考
---------
* [Terraform-Provider-Alicloud Github](https://github.com/terraform-providers/terraform-provider-alicloud)
* [Terraform-Provider-Alicloud Release](https://releases.hashicorp.com/terraform-provider-alicloud/)
* [Terraform-Provider-Alicloud Docs](https://www.terraform.io/docs/providers/alicloud/index.html)
