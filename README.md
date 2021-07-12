[![Maintained by Scaffoldly](https://img.shields.io/badge/maintained%20by-scaffoldly-blueviolet)](https://github.com/scaffoldly)
![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/scaffoldly/terraform-aws-public-website-distribution)
![Terraform Version](https://img.shields.io/badge/tf-%3E%3D0.15.0-blue.svg)

## Description

Create a CloudFront Distribution and S3 bucket for a service and stage:

- S3 Bucket as a backing store for a CloudFront Distribution
- Access Control between CloudFront and S3
- Deployment Permissions S3 Put/Sync
- Cloudfront Distro + General Cache Settings
- Route53 Record

## Usage

```hcl
module "cloudfront" {
  source = "scaffoldly/public-website-distribution/aws"

  for_each = var.stage_domains

  account_name     = var.account_name
  name             = var.name
  stage            = each.key
  dns_provider     = lookup(each.value, "dns_provider", "unknown-dns-provider")
  dns_domain_id    = lookup(each.value, "dns_domain_id", "unknown-dns-domain-id")
  domain           = lookup(each.value, "domain", "unknown-domain")
  subdomain_suffix = lookup(each.value, "subdomain_suffix", "unknown-subdomain-suffix")
  certificate_arn  = lookup(each.value, "certificate_arn", "unknown-certificate-arn")
  stage_env_vars   = lookup(each.value, "stage_env_vars", {})

  providers = {
    aws.dns = aws.dns
  }
}
```

<!-- BEGIN_TF_DOCS -->

## Requirements

## Providers

## Modules

## Resources

## Inputs

## Outputs

<!-- END_TF_DOCS -->
