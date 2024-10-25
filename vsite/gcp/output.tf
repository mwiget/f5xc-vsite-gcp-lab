output "ip_address" {
    value = {
    "${google_compute_instance.master_vm.name}-slo" = google_compute_instance.master_vm.network_interface[0].network_ip,
    "${google_compute_instance.master_vm.name}-sli" = google_compute_instance.master_vm.network_interface[1].network_ip,
    "${google_compute_instance.master_vm.name}-public" = google_compute_address.master_vm.address,
    "${google_compute_instance.workload_vm.name}"      = google_compute_address.workload.address
  }
}
output "master_vm_id" {
  value = google_compute_instance.master_vm.self_link
}
