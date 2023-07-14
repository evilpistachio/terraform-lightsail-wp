# Define required providers
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.14.0"
    }
  }
}
# Define providers
provider "aws" {
  region = var.region
}

#Create new Route53 zones
#resource "aws_route53_zone" "main" {
#name = {domain-name}

#}

#resource "aws_route53_zone" "dev" {
#name = {Domain-Name}

#}

# Create a new Route53 record 
#resource "aws_route53_record" "dev" {
  #zone_id = {Zone-ID}
 # name    = {Domain-Name}
 # type    = "A"
  #ttl     = "30"
  #records = aws_route53_zone.main.name_servers
 #  alias {
  #  name                   = {Domain-Name}
  #  zone_id                = {Zone-ID}
  #  evaluate_target_health = true
  #}
#}

# Create a new domain in Lightsail 
resource "aws_lightsail_domain" "dev_domain" {
  domain_name = {Domain-Name}
}

# Provide a static IP address to the Lightsail instance
resource "aws_lightsail_static_ip_attachment" "static_ip_attachment" {
  instance_name  = aws_lightsail_instance.instance.name
  static_ip_name = var.static_ip_attachment
}
# Create static IP
resource "aws_lightsail_static_ip" "static_ip" {
  name = var.static_ip
}

# Import pre-created Lightsail SSH Key Pair
resource "aws_lightsail_key_pair" "instance_key_pair" {
  name       = var.instance_key_pair
  public_key = file({File-Path})
}

# Create a new Wordpress Lightsail Instance
resource "aws_lightsail_instance" "instance" {
  name              = var.instance
  availability_zone = var.instance_availability_zone
  blueprint_id      = var.instance_blueprintid
  bundle_id         = var.instance_bundleid
  key_pair_name     = var.instance_key_pair
  depends_on        = [aws_lightsail_static_ip.static_ip]
  tags = {
    Environment = "Dev"
  }
}

#connection {
# type        = "ssh"
# user        = "bitnami"
# host        = self.public_ip_address
# private_key = file({File-Path})
#}
# provisioner "remote-exec" {
#  inline = [ 
#    "sudo cat /home/bitnami/bitnami_application_password"
#   ]

# }





