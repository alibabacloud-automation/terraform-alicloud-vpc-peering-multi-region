terraform-alicloud-vpc-peering-multi-region
=====================================================================

本 Terraform 模块可在同一个阿里云帐户和多区域中的两个VPC之间创建对等连接。

本 Module 支持创建以下资源:

* [alicloud_cen_instance](https://www.terraform.io/docs/providers/alicloud/r/cen_instance.html)
* [alicloud_cen_instance_attachment](https://www.terraform.io/docs/providers/alicloud/r/cen_instance_attachment.html)
* [alicloud_cen_bandwidth_limit](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_limit.html)
* [alicloud_cen_bandwidth_package](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_package.html)
* [alicloud_cen_bandwidth_package_attachment](https://www.terraform.io/docs/providers/alicloud/r/cen_bandwidth_package_attachment.html)

## Terraform 版本

本模板要求使用版本 Terraform 0.12 和 阿里云 Provider 1.57.0+。

## 用法

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

## 示例

* [创建vpc-peering-multi-region 示例](https://github.com/terraform-alicloud-modules/terraform-alicloud-vpc-peering-multi-region/tree/master/examples/complete)

## 注意事项

* 本 Module 使用的 AccessKey 和 SecretKey 可以直接从 `profile` 和 `shared_credentials_file` 中获取。如果未设置，可通过下载安装 [aliyun-cli](https://github.com/aliyun/aliyun-cli#installation) 后进行配置。

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
