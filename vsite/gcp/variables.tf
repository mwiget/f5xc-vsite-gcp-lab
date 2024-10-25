variable "ssh_public_key" {}
variable "f5xc_virtual_site" {}
variable "f5xc_cluster_name" {}
variable "f5xc_tunnel_type" {}

# gcp

variable "gcp_project_id" {}
variable "gcp_region" {}
variable "gcp_owner_tag" {}
variable "gcp_slo_subnet_id" {}
variable "gcp_sli_subnet_id" {}
variable "gcp_sli_workload_ip" {}
variable "gcp_availability_zone" {}
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
