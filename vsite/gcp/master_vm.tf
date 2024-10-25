resource "google_compute_instance" "master_vm" {
  name         = format("%s-m0", var.f5xc_cluster_name)
  machine_type = var.gcp_machine_type
  project      = var.gcp_project_id
  zone         = format("%s-%s", var.gcp_region, var.gcp_availability_zone)

  # Specify the Ubuntu image
  boot_disk {
    initialize_params {
      image    = var.gcp_image_name
      size     = var.gcp_disk_size
    }
  }

  network_interface {
    subnetwork = var.gcp_slo_subnet_id
    access_config {
      nat_ip = google_compute_address.master_vm.address
    }
  }

  network_interface {
    subnetwork = var.gcp_sli_subnet_id
  }

  metadata = {
    user-data = templatefile("${path.module}/templates/cloud-config-base.tmpl", {
      ssh_public_key = var.ssh_public_key,
      node_registration_token = terraform_data.token.input
     })
    Creator = var.gcp_owner_tag
  }
}

resource "google_compute_address" "master_vm" {
  name        = format("%s-master-vm-public-ip", var.f5xc_cluster_name)
  region      = var.gcp_region
  project     = var.gcp_project_id
}
