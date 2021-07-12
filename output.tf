output "stage" {
  value       = var.stage
  description = "Re-output of var.stage"
}

output "stage_env_vars" {
  value       = var.stage_env_vars
  description = "Re-output of var.stage_env_vars"
}

output "bucket_name" {
  value       = aws_s3_bucket.bucket.id
  description = "The S3 bucket created"
}

output "distribution_id" {
  value       = aws_cloudfront_distribution.distribution.id
  description = "The CloudFront distribution created"
}
