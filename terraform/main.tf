terraform {
  required_version = ">= 1.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  backend "s3" {
    bucket = "yeungtech-terraform-state"
    key    = "yeungtech-site/terraform.tfstate"
    region = "sa-east-1"
  }
}

provider "aws" {
  region = var.aws_region
}

# ─── Route 53 ────────────────────────────────────────────────────────────────

resource "aws_route53_zone" "site" {
  name = var.domain_name
}

resource "aws_route53_record" "site" {
  zone_id = aws_route53_zone.site.zone_id
  name    = var.domain_name
  type    = "A"
  ttl     = 300
  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153",
  ]
}
