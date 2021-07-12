variable "account_name" {
  type        = string
  description = "The AWS Account name"
}
variable "name" {
  type        = string
  description = "The service name"
}
variable "stage" {
  type        = string
  description = "The service stage"
}
variable "stage_env_vars" {
  type        = map(string)
  default     = {}
  description = "A map of the environment variables"
}
variable "dns_provider" {
  type        = string
  description = "The DNS Provider (Currently only Route53)"
}
variable "dns_domain_id" {
  type        = string
  description = "The Route53 Zone ID"
}
variable "domain" {
  type        = string
  description = "The TLD to host the portal on"
}
variable "subdomain_suffix" {
  type        = string
  description = "The subdomain suffix. Use an empty string for no suffix"
}
variable "certificate_arn" {
  type        = string
  description = "The certificate ARN provisioned for the domain"
}
