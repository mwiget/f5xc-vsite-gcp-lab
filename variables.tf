variable "project_prefix" {
  type        = string
  default     = "f5xc"
}

variable "ssh_public_key" {
  type        = string
  default     = ""
}

# F5XC 

variable "f5xc_api_url"        {}
variable "f5xc_api_token"      {}
variable "f5xc_tenant"         {}
variable "f5xc_tunnel_type" {
  type    = string
  default = "SITE_TO_SITE_TUNNEL_IPSEC_OR_SSL"
}

# gcp

variable "gcp_project_id" {}
variable "gcp_credentials_file" {}
variable "gcp_disk_size" {
  type = number
  default = 80
}

variable "gcp_region" {}
variable "gcp_owner_tag" {}
variable "gcp_image_name" {}
variable "gcp_machine_type" {}
