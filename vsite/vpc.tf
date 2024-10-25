resource "google_compute_network" "slo" {
  name                    = format("%s-slo", var.f5xc_vsite_name)
  project                 = var.gcp_project_id
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_network" "sli" {
  name                    = format("%s-sli", var.f5xc_vsite_name)
  project                 = var.gcp_project_id
  auto_create_subnetworks = "false"
  routing_mode            = "REGIONAL"
}

resource "google_compute_subnetwork" "slo" {
  name          = format("%s-slo", var.f5xc_vsite_name)
  project       = var.gcp_project_id
  ip_cidr_range = var.gcp_slo_subnets[0]
  network       = google_compute_network.slo.self_link
  region        = var.gcp_region
}

resource "google_compute_subnetwork" "sli" {
  name          = format("%s-sli", var.f5xc_vsite_name)
  project       = var.gcp_project_id
  ip_cidr_range = var.gcp_sli_subnets[0]
  network       = google_compute_network.sli.self_link
  region        = var.gcp_region
}

resource "google_compute_firewall" "allow-sli" {
  name    = format("%s-allow-sli", var.f5xc_vsite_name)
  project = var.gcp_project_id
  network = google_compute_network.sli.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["0-65535"]
  }
  allow {
    protocol = "udp"
    ports    = ["0-65535"]
  }
  source_ranges = var.gcp_sli_subnets
}

resource "google_compute_firewall" "allow-slo" {
  name    = format("%s-allow-slo", var.f5xc_vsite_name)
  project = var.gcp_project_id
  network = google_compute_network.slo.name
  allow {
    protocol = "icmp"
  }
  allow {
    protocol = "tcp"
    ports    = ["80"]
  }
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  allow {
    protocol = "udp"
    ports    = ["4500"]
  }
  source_ranges = ["0.0.0.0/0"]
}
