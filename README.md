# f5xc-vsite-gcp-lab

```
                  ......................         ......................
                  .      vsite-1       .         .       vsite-2      .
+-------------+   .       +----------+ .         . +----------+       .   +-------------+
| workload-1a |   .       | vsite-1a | .         . | vsite-2a |       .   | workload-2a |
+-------------+   . +---+ +----------+ .         . +----------+ +---+ .   +-------------+
                  . |lnb|              .         .              |nlb| .
+-------------+   . +---+ +----------+ .         . +----------+ +---+ .   +-------------+
| workload-1b |   .       | vsite-1b | .         . | vsite-2b |       .   | workload-2b |
+-------------+   .       +----------+ .         . +----------+       .   +-------------+
                  ......................         ......................
```

```
$ terraform init
$ terraform plan
$ terraform apply

ip_address = [
  {
    "mw-gcp-vsite-1a-m0-public" = "34.65.212.182"
    "mw-gcp-vsite-1a-m0-sli" = "10.1.11.2"
    "mw-gcp-vsite-1a-m0-slo" = "10.1.1.2"
    "mw-gcp-vsite-1a-sli-workload" = "34.65.7.188"
  },
  {
    "mw-gcp-vsite-1b-m0-public" = "34.65.109.194"
    "mw-gcp-vsite-1b-m0-sli" = "10.1.11.3"
    "mw-gcp-vsite-1b-m0-slo" = "10.1.1.3"
    "mw-gcp-vsite-1b-sli-workload" = "34.65.192.7"
  },
  {
    "mw-gcp-vsite-2a-m0-public" = "34.65.55.173"
    "mw-gcp-vsite-2a-m0-sli" = "10.2.11.3"
    "mw-gcp-vsite-2a-m0-slo" = "10.2.1.3"
    "mw-gcp-vsite-2a-sli-workload" = "34.65.169.10"
  },
  {
    "mw-gcp-vsite-2b-m0-public" = "34.65.113.165"
    "mw-gcp-vsite-2b-m0-sli" = "10.2.11.2"
    "mw-gcp-vsite-2b-m0-slo" = "10.2.1.2"
    "mw-gcp-vsite-2b-sli-workload" = "34.65.251.131"
  },
]
```
