variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_availability_zone" {
  type    = string
  default = "us-east-1b"
}

# Defines instance name
variable "instance" {
  type    = string
  default = {Default-Name}
}

# Defines pre-configured image to deploy on lightsail instance
variable "instance_blueprintid" {
  type    = string
  default = "wordpress"
}

# Defines size of EC2 instance size - Small is 1GB RAM
variable "instance_bundleid" {
  type    = string
  default = "small_2_0"
}

# Defines the key pair to use when using SSH
variable "instance_key_pair" {
  type    = string
  default = "wp-key"

}


variable "static_ip" {
  type    = string
  default = "Wordpress-IP"
}

variable "static_ip_attachment" {
  type    = string
  default = "Wordpress-IP"
}
