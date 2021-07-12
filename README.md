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

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.15 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 3.33.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.33.0 |
| <a name="provider_aws.dns"></a> [aws.dns](#provider\_aws.dns) | 3.33.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_cloudfront_distribution.distribution](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution) | resource |
| [aws_cloudfront_origin_access_identity.identity](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_origin_access_identity) | resource |
| [aws_route53_record.record](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/route53_record) | resource |
| [aws_s3_bucket.bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket) | resource |
| [aws_s3_bucket_policy.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_policy) | resource |
| [aws_s3_bucket_public_access_block.block](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/s3_bucket_public_access_block) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_iam_policy_document.bucket_policy](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/iam_policy_document) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_route53_zone.zone](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/route53_zone) | data source |
| [aws_s3_bucket.logs_bucket](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/s3_bucket) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_account_name"></a> [account\_name](#input\_account\_name) | The AWS Account name | `string` | n/a | yes |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | The certificate ARN provisioned for the domain | `string` | n/a | yes |
| <a name="input_dns_domain_id"></a> [dns\_domain\_id](#input\_dns\_domain\_id) | The Route53 Zone ID | `string` | n/a | yes |
| <a name="input_dns_provider"></a> [dns\_provider](#input\_dns\_provider) | The DNS Provider (Currently only Route53) | `string` | n/a | yes |
| <a name="input_domain"></a> [domain](#input\_domain) | The TLD to host the portal on | `string` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | The service name | `string` | n/a | yes |
| <a name="input_stage"></a> [stage](#input\_stage) | The service stage | `string` | n/a | yes |
| <a name="input_stage_env_vars"></a> [stage\_env\_vars](#input\_stage\_env\_vars) | A map of the environment variables | `map(string)` | `{}` | no |
| <a name="input_subdomain_suffix"></a> [subdomain\_suffix](#input\_subdomain\_suffix) | The subdomain suffix. Use an empty string for no suffix | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_bucket_name"></a> [bucket\_name](#output\_bucket\_name) | The S3 bucket created |
| <a name="output_distribution_id"></a> [distribution\_id](#output\_distribution\_id) | The CloudFront distribution created |
| <a name="output_stage"></a> [stage](#output\_stage) | Re-output of var.stage |
| <a name="output_stage_env_vars"></a> [stage\_env\_vars](#output\_stage\_env\_vars) | Re-output of var.stage\_env\_vars |
<!-- END_TF_DOCS -->
