variable "ssh_public_key" {}
variable "f5xc_vsite_name" {}

variable "f5xc_api_url" {}
variable "f5xc_api_token" {}
variable "f5xc_tenant" {}
variable "f5xc_tunnel_type" {}

# gcp

variable "gcp_project_id" {}
variable "gcp_region" {}
variable "vpc_cidr_block" {}
variable "gcp_owner_tag" {}
variable "gcp_slo_subnets" {
  type = list(string)
  default = []
}
variable "gcp_sli_subnets" {
  type = list(string)
  default = []
}
variable "gcp_sli_workload_ip" {
  type = list(string)
  default = []
}
variable "gcp_availability_zones" {
  type = list(string)
  default = []
}
variable "gcp_image_name" {}
variable "gcp_machine_type" {}
variable "gcp_disk_size" {}

variable "f5xc_ce_slo_probe_port" {
  type    = number
  default = 9505
}

variable "f5xc_ce_sli_probe_port" {
  type    = number
  default = 65450
}
