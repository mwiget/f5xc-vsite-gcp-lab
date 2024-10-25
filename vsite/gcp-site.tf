module "gcp-node" {
  count                        = length(var.gcp_availability_zones)
  source                       = "./gcp"
  f5xc_cluster_name            = format("%s%s",var.f5xc_vsite_name, element(var.gcp_availability_zones, count.index))
  f5xc_virtual_site            = var.f5xc_vsite_name
  ssh_public_key               = var.ssh_public_key
  gcp_project_id               = var.gcp_project_id
  gcp_region                   = var.gcp_region

  gcp_machine_type             = var.gcp_machine_type
  gcp_disk_size                = var.gcp_disk_size

  gcp_availability_zone        = element(var.gcp_availability_zones, count.index)
  gcp_image_name               = var.gcp_image_name
  gcp_slo_subnet_id            = google_compute_subnetwork.slo.self_link 
  gcp_sli_subnet_id            = google_compute_subnetwork.sli.self_link 
  gcp_owner_tag                = var.gcp_owner_tag
  gcp_sli_workload_ip          = var.gcp_sli_workload_ip[count.index]
  f5xc_tunnel_type             = var.f5xc_tunnel_type
  # backend_address_pool_slo_id  = gcprm_lb_backend_address_pool.slo.id
  # backend_address_pool_sli_id  = gcprm_lb_backend_address_pool.sli.id
}
