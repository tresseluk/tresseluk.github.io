resource "aws_route53_record" "dns_record" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = var.dns_zone_name
  type    = "A"
  records = [
    "185.199.108.153",
    "185.199.109.153",
    "185.199.110.153",
    "185.199.111.153"
  ]
  ttl = 300
}

resource "aws_route53_record" "dns_record_www" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = "www.${var.dns_zone_name}"
  type    = "CNAME"
  records = ["${var.github_username}.github.io."]
  ttl = 300
}

resource "aws_route53_record" "dns_record_mail" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = var.dns_zone_name
  type    = "MX"
  records = ["0 ${replace(var.dns_zone_name, ".", "-")}.mail.protection.outlook.com."]
  ttl = 300
}

resource "aws_route53_record" "dns_record_autodiscover" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = "autodiscover.${var.dns_zone_name}"
  type    = "CNAME"
  records = ["autodiscover.outlook.com."]
  ttl = 300
}

resource "aws_route53_record" "dns_record_spf" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = var.dns_zone_name
  type    = "TXT"
  records = ["v=spf1 include:spf.protection.outlook.com -all"]
  ttl = 300
}

resource "aws_route53_record" "dns_record_github_pages" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = "_github-pages-challenge-${var.github_username}.${var.dns_zone_name}"
  type    = "TXT"
  records = [var.github_pages_code]
  ttl = 300
}