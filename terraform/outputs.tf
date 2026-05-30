output "nameservers" {
  value       = aws_route53_zone.site.name_servers
  description = "Point your domain registrar to these nameservers"
}
