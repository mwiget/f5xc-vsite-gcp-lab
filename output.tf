output "ip_address" {
  value = flatten(concat(
    module.vsite1[*].node.gcp[*].ip_address,
    module.vsite2[*].node.gcp[*].ip_address
  ))
}

# output "load_balancer" {
#   value = {
#     vsite1 = flatten(concat(module.vsite1.nlb.private_ip_addresses)),
#     vsite2 = flatten(concat(module.vsite2.nlb.private_ip_addresses))
#   }
# }
