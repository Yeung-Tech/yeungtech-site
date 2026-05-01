output "cloudfront_domain" {
  value = aws_cloudfront_distribution.site.domain_name
}

output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.site.id
}

output "s3_bucket" {
  value = aws_s3_bucket.site.bucket
}

output "nameservers" {
  value       = aws_route53_zone.site.name_servers
  description = "Point your domain registrar to these nameservers"
}
