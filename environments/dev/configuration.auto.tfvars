global_settings = {
  default_region = "region1"
  regions = {
    region1 = "australia-southeast1"
    region2 = "australia-southeast2"
  }
}

projects = {
  demo = {
    name   = "art-gcve-sandpit"
    region = "region1"
  },
  network = {
    name   = "art-gcve-sandpit"
    region = "region1"
  }
}

vpcs = {
  trust-vpc = {
    project_key = "network"
    vpc = {
        name                            = "vpc-trust-dev"
        auto_create_subnetworks         = false
        routing_mode                    = "REGIONAL"
        delete_default_routes_on_create = true
        mtu                             = 0
      }
     subnets = {
       trust = {
         name          = "trust"
         ip_cidr_range = "192.168.2.0/24"
         region        = "australia-southeast1"
         //nsg_key       = "web"
         //nsg_key = "web"
       }
     }
    network_firewall_rules = {
      standard-ingress = {
        name                 = "fw-vpc-trust-dev-ingress123"
        description          = "SSH Ingress Rule from Internet"
        direction            = "INGRESS"
        action               = "allow"
        priority             = 1000
        ranges               = ["0.0.0.0/0"]
        sources              = []
        targets              = []
        use_service_accounts = false
        rules = [
          {
            protocol = "all"
            ports    = []
          }
        ]
        extra_attributes = {
          flow_logs = true
        }
      },
      standard-egress = {
        name                 = "fw-vpc-trust-dev-egress"
        description          = "Deny All Egress Rule to Internet"
        direction            = "EGRESS"
        action               = "deny"
        priority             = 65535
        ranges               = ["0.0.0.0/0"]
        sources              = []
        targets              = []
        use_service_accounts = false
        rules = [
          {
            protocol = "all"
            ports    = []
          }
        ]
        extra_attributes = {
          flow_logs = true
        }
      }
    }
  },
  untrust-vpc = {
    project_key = "network"
    vpc = {
      name                            = "vpc-untrust-dev"
      auto_create_subnetworks         = false
      routing_mode                    = "REGIONAL"
      delete_default_routes_on_create = false
      mtu                             = 0
    }
     subnets = {
       untrust = {
         name          = "untrust"
         ip_cidr_range = "192.168.1.0/24"
         region        = "australia-southeast1"
       }
     }
  },
  mgmt-vpc = {
    project_key = "network"
    vpc = {
      name                            = "vpc-mgmt-dev"
      auto_create_subnetworks         = false
      routing_mode                    = "REGIONAL"
      delete_default_routes_on_create = false
      mtu                             = 0
    }
     subnets = {
       mgmt = {
         name          = "mgmt"
         ip_cidr_range = "192.168.0.0/24"
         region        = "australia-southeast1"
       }
     }
  },
  peters-vpc = {
    project_key = "network"
    vpc = {
      name                            = "vpc-mgmt-peters"
      auto_create_subnetworks         = false
      routing_mode                    = "REGIONAL"
      delete_default_routes_on_create = false
      mtu                             = 0
    }
  }
}
