resource "google_compute_instance_group" "slo" {
  count        = length(var.gcp_availability_zones)
  name         = format("%s%s-slo-ig",var.f5xc_vsite_name, element(var.gcp_availability_zones, count.index))
  project      = var.gcp_project_id
  zone         = format("%s-%s", var.gcp_region, element(var.gcp_availability_zones, count.index))
  network      = google_compute_network.slo.self_link
  instances    = [
    module.gcp-node[count.index].master_vm_id
  ]
}

# resource "google_compute_instance_group" "sli" {
#   count        = length(var.gcp_availability_zones)
#   name         = format("%s%s-sli-ig",var.f5xc_vsite_name, element(var.gcp_availability_zones, count.index))
#   project      = var.gcp_project_id
#   zone         = format("%s-%s", var.gcp_region, element(var.gcp_availability_zones, count.index))
#   network      = google_compute_network.sli.self_link
#   instances    = [
#     module.gcp-node[count.index].master_vm_id
#   ]
# }

# resource "google_compute_health_check" "slo" {
#   name         = format("%s-slo-hc",var.f5xc_vsite_name)
#   project      = var.gcp_project_id
#   tcp_health_check {
#     port = var.f5xc_ce_slo_probe_port
#   }
# }

# resource "google_compute_health_check" "sli" {
#   name         = format("%s-sli-hc",var.f5xc_vsite_name)
#   project      = var.gcp_project_id
#   tcp_health_check {
#     port = var.f5xc_ce_sli_probe_port
#   }
# }

# resource "google_compute_address" "slo_lb" {
#   name         = format("%s-slo-lb-ip",var.f5xc_vsite_name)
#   project      = var.gcp_project_id
#   region       = var.gcp_region
#   subnetwork   = google_compute_network.slo.self_link
#   address_type = "INTERNAL"
# }

# resource "google_compute_address" "sli_lb" {
#   name         = format("%s-sli-lb-ip",var.f5xc_vsite_name)
#   project      = var.gcp_project_id
#   region       = var.gcp_region
#   subnetwork   = google_compute_network.sli.self_link
#   address_type = "INTERNAL"
# }

# resource "google_compute_forwarding_rule" "slo" {
#   name                  = format("%s-slo-forwarding-rule",var.f5xc_vsite_name)
#   project               = var.gcp_project_id
#   region                = var.gcp_region
#   load_balancing_scheme = "INTERNAL"
#   backend_service       = google_compute_backend_service.slo.self_link
#   ip_protocol           = "L3_DEFAULT"
#   ip_address            = google_compute_address.slo_lb.address
# }

# resource "google_compute_forwarding_rule" "sli" {
#   name                  = format("%s-sli-forwarding-rule",var.f5xc_vsite_name)
#   project               = var.gcp_project_id
#   region                = var.gcp_region
#   load_balancing_scheme = "INTERNAL"
#   backend_service       = google_compute_backend_service.sli.self_link
#   ip_protocol           = "L3_DEFAULT"
#   ip_address            = google_compute_address.sli_lb.address
# }

# resource "google_compute_backend_service" "slo" {
#   name                  = format("%s-slo-backend-service",var.f5xc_vsite_name)
#   project               = var.gcp_project_id
#   load_balancing_scheme = "INTERNAL_SELF_MANAGED"
#   health_checks         = [google_compute_health_check.slo.self_link]

#   dynamic "backend" {
#     for_each = google_compute_instance_group.slo
#     content {
#       group = backend.value.self_link
#     }
#   }
# }

# resource "google_compute_backend_service" "sli" {
#   name                  = format("%s-sli-backend-service",var.f5xc_vsite_name)
#   project               = var.gcp_project_id
#   load_balancing_scheme = "INTERNAL_SELF_MANAGED"
#   health_checks         = [google_compute_health_check.sli.self_link]

#   dynamic "backend" {
#     for_each = google_compute_instance_group.sli
#     content {
#       group = backend.value.self_link
#     }
#   }
# }
