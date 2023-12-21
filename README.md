# Terraform Cloud Workspace `web-assets`

> This repository manages web-accessible assets for [@workloads](https://github.com/workloads).

## Table of Contents

<!-- TOC -->
* [Terraform Cloud Workspace `web-assets`](#terraform-cloud-workspace-web-assets)
  * [Table of Contents](#table-of-contents)
  * [Requirements](#requirements)
  * [Usage](#usage)
    * [Inputs](#inputs)
    * [Outputs](#outputs)
  * [Contributors](#contributors)
  * [License](#license)
<!-- TOC -->

## Requirements

- HashiCorp Terraform `1.6.x` or [newer](https://developer.hashicorp.com/terraform/downloads)

Optional, and only needed for documentation generation:

- `terraform-docs` `0.17.0` or [newer](https://terraform-docs.io/user-guide/installation/)

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
| aws_console_url | AWS Console URL. |
| aws_region | Exported Attributes for `module.web_assets.aws_cloudfront_distribution.aliases`. |
| aws_s3_bucket | Exported Attribute for `module.web_assets.aws_s3_bucket`. |
<!-- END_TF_DOCS -->

## Contributors

For a list of current (and past) contributors to this repository, see [GitHub](https://github.com/workloads/web-assets/graphs/contributors).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may download a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

See the License for the specific language governing permissions and limitations under the License.
