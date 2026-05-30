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

# Required to destroy orphaned ACM resources from previous state
provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
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

resource "aws_route53_record" "www" {
  zone_id = aws_route53_zone.site.zone_id
  name    = "www.${var.domain_name}"
  type    = "CNAME"
  ttl     = 300
  records = ["yeung-tech.github.io"]
}
