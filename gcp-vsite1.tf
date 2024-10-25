module "vsite1" {
  source                    = "./vsite"
  f5xc_vsite_name           = format("%s-gcp-vsite-1", var.project_prefix)

  ssh_public_key            = var.ssh_public_key
  gcp_image_name          = var.gcp_image_name
  gcp_disk_size           = var.gcp_disk_size
  gcp_machine_type        = var.gcp_machine_type
  gcp_region              = var.gcp_region
  gcp_project_id          = var.gcp_project_id

  vpc_cidr_block           = "10.1.0.0/16"
  gcp_availability_zones  = [ "a", "b" ]
  gcp_slo_subnets         = [ "10.1.1.0/24", "10.1.2.0/24" ]
  gcp_sli_subnets         = [ "10.1.11.0/24", "10.1.12.0/24"]
  gcp_sli_workload_ip     = [ "10.1.11.100", "10.1.11.101" ]
  gcp_owner_tag           = var.gcp_owner_tag

  f5xc_tunnel_type          = var.f5xc_tunnel_type
  f5xc_tenant               = var.f5xc_tenant
  f5xc_api_url              = var.f5xc_api_url
  f5xc_api_token            = var.f5xc_api_token
}
