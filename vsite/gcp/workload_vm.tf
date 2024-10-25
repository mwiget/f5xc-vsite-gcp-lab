resource "google_compute_instance" "workload_vm" {
  name         = format("%s-sli-workload", var.f5xc_cluster_name)
  machine_type = "e2-small"       # 2 vcpu (shared) and 2 GB RAM
  project      = var.gcp_project_id
  zone         = format("%s-%s", var.gcp_region, var.gcp_availability_zone)

  # Specify the Ubuntu image
  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2404-lts-amd64"
    }
  }

  network_interface {
    subnetwork = var.gcp_sli_subnet_id
    network_ip = var.gcp_sli_workload_ip
    access_config {
      nat_ip = google_compute_address.workload.address
    }
  }

  metadata = {
    user-data = templatefile("${path.module}/templates/ubuntu_workload.tmpl", {
       ssh_public_key = var.ssh_public_key
     })
    Creator = var.gcp_owner_tag
  }
}

resource "google_compute_address" "workload" {
  name        = format("%s-workload-public-ip", var.f5xc_cluster_name)
  region      = var.gcp_region
  project     = var.gcp_project_id
}
