output "aws_cloudfront_aliases" {
  description = "Exported Attributes for `module.web_assets.aws_cloudfront_distribution.aliases`."
  value       = module.web_assets.aws_cloudfront_distribution.aliases
}

output "aws_cloudfront_domain_name" {
  description = "Exported Attribute for `module.web_assets.aws_cloudfront_distribution.domain_name`."
  value       = module.web_assets.aws_cloudfront_distribution.domain_name
}

output "aws_console_urls" {
  description = "AWS Console URLs."
  value = [
    "https://us-east-1.console.aws.amazon.com/cloudfront/v3/home?region=${var.management_region_aws}#/distributions/${module.web_assets.aws_cloudfront_distribution.id}"
  ]
}

output "aws_s3_bucket" {
  description = "Exported Attribute for `module.web_assets.aws_s3_bucket`."
  value       = module.web_assets.aws_s3_bucket.bucket
}

output "workspace_url" {
  description = "Terraform Cloud Workspace URL."
  value       = "https://app.terraform.io/app/${var.github_owner}/workspaces/repositories"
}

output "nomad_pack_registry_commands" {
  description = "Nomad Pack CLI Commands for Registry operations."

  value = {
    add_registry = "nomad-pack registry add ${var.github_owner} ${local.pack_registry_repository_url}"
  }
}
