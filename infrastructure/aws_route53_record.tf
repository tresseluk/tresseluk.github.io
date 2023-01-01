resource "aws_route53_record" "dns_record" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = aws_route53_zone.dns_zone.name
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
  name    = "www.${aws_route53_zone.dns_zone.name}"
  type    = "CNAME"
  records = ["tresseluk.github.io."]
  ttl = 300
}

resource "aws_route53_record" "dns_record_mail" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = aws_route53_zone.dns_zone.name
  type    = "MX"
  records = ["0 tressel-co-uk.mail.protection.outlook.com."]
  ttl = 300
}

resource "aws_route53_record" "dns_record_autodiscover" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = "autodiscover.${aws_route53_zone.dns_zone.name}"
  type    = "CNAME"
  records = ["autodiscover.outlook.com."]
  ttl = 300
}

resource "aws_route53_record" "dns_record_spf" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = aws_route53_zone.dns_zone.name
  type    = "TXT"
  records = ["v=spf1 include:spf.protection.outlook.com -all"]
  ttl = 300
}

resource "aws_route53_record" "dns_record_github_pages" {
  zone_id = aws_route53_zone.dns_zone.id
  name    = "_github-pages-challenge-tresseluk.${aws_route53_zone.dns_zone.name}"
  type    = "TXT"
  records = ["f9abed490ac401a2ee3be1fc2a688e"]
  ttl = 300
}