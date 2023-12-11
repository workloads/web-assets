locals {
  # random string for use with S3 Bucket names
  bucket_suffix = "${var.subdomain}-${random_string.bucket_suffix.id}"

  # take domain name and remove dot characters from string, then append suffix with random string
  bucket_name = "${replace(var.domain, ".", "")}-${local.bucket_suffix}"
}

# see https://registry.terraform.io/modules/ksatirli/cloudfront-website/aws/1.0.0
module "web_assets" {
  source  = "ksatirli/cloudfront-website/aws"
  version = "1.3.0"

  # see https://developer.hashicorp.com/terraform/language/providers/configuration#alias-multiple-provider-configurations
  providers = {
    # NOTE: ACM Certificates for usage with CloudFront must be created in the `us-east-1` region, see https://amzn.to/2TW2J16
    aws.certificate = aws.certificate
  }

  s3_bucket_name = local.bucket_name
  domain_name    = var.domain
  subdomain_name = var.subdomain
}

# render `index.html` for all items in `var.redirect_paths` to prevent sub-directory listings
# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_object
resource "aws_s3_object" "redirects" {
  for_each = {
    for redirect in var.redirect_paths : redirect.name => redirect
  }

  bucket = module.web_assets.aws_s3_bucket.id
  key    = "${each.value.name}/index.html"

  # see https://developer.hashicorp.com/terraform/language/functions/templatefile
  content = templatefile("./templates/index.tftpl.html", {
    target = each.value.target
  })

  tags = {
    "redirect:key" = each.value.name
    "redirect:url" = each.value.target
  }

  content_type = "text/html"
}
