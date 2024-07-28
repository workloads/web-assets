variable "management_region_aws" {
  type        = string
  description = "AWS-specific `Management` Region Identifier."
}

variable "domain" {
  type        = string
  description = "Parent Domain."
  default     = "workloads.io"
}

variable "redirect_paths" {
  type = list(object({
    name   = string
    target = string
  }))

  description = "List of S3 Paths to create `index.html` redirects in."

  default = [
    {
      name   = "."
      target = "https://workloads.io"
      }, {
      name   = "nomad-pack-registry"
      target = "https://github.com/workloads/nomad-pack-registry"
    },
  ]
}

variable "subdomain" {
  type        = string
  description = "Subdomain."
  default     = "assets"
}

variable "tfe_team_token_viewers" {
  type        = string
  description = "HCP Terraform `viewers` Team Token."
  sensitive   = true
}
