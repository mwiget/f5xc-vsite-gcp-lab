resource "restapi_object" "site" {
  id_attribute  = "metadata/name"
  path          = "/config/namespaces/system/securemesh_site_v2s"
  # var.master_node_count == 1 ? jsonencode
  data          = jsonencode({
    "metadata": {
      "name": var.f5xc_cluster_name,
      "disable": false,
      "labels": {
        "virtual_site": var.f5xc_virtual_site
      }
    },
    "spec": {
      "gcp": {
        "not_managed": {}
      },
      "no_network_policy": {},
      "no_forward_proxy": {},
      "software_settings": {
        "sw": {
          "default_sw_version": {}
        },
        "os": {
          "default_os_version": {}
        }
      },
      "upgrade_settings": {
        "kubernetes_upgrade_drain": {
          "disable_upgrade_drain": {}
        }
      },
      "logs_streaming_disabled": {},
      "block_all_services": {},
      "performance_enhancement_mode": {
        "perf_mode_l7_enhanced": {}
      },
      "offline_survivability_mode": {
        "no_offline_survivability_mode": {}
      },
      "tunnel_dead_timeout": 0,
      "load_balancing": {
        "vip_vrrp_mode": "VIP_VRRP_DISABLE"
      },
      "no_s2s_connectivity_sli": {},
      "no_s2s_connectivity_slo": {},
      "local_vrf": {
        "default_config": {},
        "default_sli_config": {}
      },
      "tunnel_type": var.f5xc_tunnel_type,
      "re_select": {
        "geo_proximity": {}
      },
      "disable_ha": {}
    }
  })
}

output "site" {
  value = { 
    raw = restapi_object.site
    token = terraform_data.token.input
  }
}
