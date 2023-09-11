# Terraform Cloud Workspace `web-assets`

> This directory manages Web-accessible Assets for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [Terraform Cloud Workspace `web-assets`](#terraform-cloud-workspace-web-assets)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Author Information](#author-information)
  * [License](#license)
<!-- TOC -->

## Requirements

- HashiCorp Terraform `1.5.x` or [newer](https://developer.hashicorp.com/packer/downloads)

Optional, and only needed for documentation generation:

- `terraform-docs` `0.16.0` or [newer](https://terraform-docs.io/user-guide/installation/)

## Usage

This repository uses a standard Terraform workflow (`init`, `plan`, `apply`).

For more information, including detailed usage guidelines, see the [Terraform documentation](https://developer.hashicorp.com/terraform/cli/commands).

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| management_region_aws | AWS-specific `Management` Region Identifier. | `string` | yes |
| domain | Parent Domain. | `string` | no |
| redirect_paths | List of S3 Paths to create `index.html` redirects in. | <pre>list(object({<br>    name   = string<br>    target = string<br>  }))</pre> | no |
| subdomain | Subdomain. | `string` | no |

### Outputs

| Name | Description |
|------|-------------|
| aws_cli_commands | AWS CLI Command for CloudFront operations. |
| aws_cloudfront_aliases | Exported Attributes for `module.web_assets.aws_cloudfront_distribution.aliases`. |
| aws_cloudfront_distribution_id | Exported Attributes for `module.web_assets.aws_cloudfront_distribution.id`. |
| aws_cloudfront_domain_name | Exported Attribute for `module.web_assets.aws_cloudfront_distribution.domain_name`. |
| aws_console_urls | AWS Console URLs. |
| aws_region | Exported Attributes for `module.web_assets.aws_cloudfront_distribution.aliases`. |
| aws_s3_bucket | Exported Attribute for `module.web_assets.aws_s3_bucket`. |
<!-- END_TF_DOCS -->

## Author Information

This repository is maintained by the contributors listed on [GitHub](https://github.com/workloads/web-assets/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
