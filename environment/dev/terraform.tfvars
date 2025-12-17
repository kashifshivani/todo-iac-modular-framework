# RESOURCE GROUP

rg = {
  "rg1" = {
    name       = "test-rg"
    location   = "centralindia"
    managed_by = "terraform"
    tags = {
      environment = "prod"
      owner       = "xyz"
    }
  }



  "rg2" = {
    name       = "test2-rg"
    location   = "North Europe"
    managed_by = "terraform"
    tags = {
      environment = "prod"
      owner       = "xyz"
    }
  }
}



# STORAGE ACCOUNT

sgs = {
  "sa1" = {
    name                              = "sa745992"
    resource_group_name               = "test-rg"
    location                          = "centralindia"
    account_tier                      = "Standard"
    account_replication_type          = "GRS"
    account_kind                      = "FileStorage"
    cross_tenant_replication_enabled  = true
    access_tier                       = "Hot"
    provisioned_billing_model_version = "V2"
    edge_zone                         = null
    https_traffic_only_enabled        = true
    min_tls_version                   = "TLS1_2"
    allow_nested_items_to_be_public   = true
    shared_access_key_enabled         = true
    public_network_access_enabled     = true
    default_to_oauth_authentication   = false
    is_hns_enabled                    = false
    nfsv3_enabled                     = false
    large_file_share_enabled          = false
    local_user_enabled                = true
    queue_encryption_key_type         = "Service"
    table_encryption_key_type         = "Service"
    infrastructure_encryption_enabled = false
    allowed_copy_scope                = null
    sftp_enabled                      = false
    dns_endpoint_type                 = "Standard"

    network_rules = {
      rule1 = {
        default_action = "Deny"
        bypass         = ["AzureServices"]
        ip_rules       = ["49.36.25.218"]

      }
    }
    # Tags
    tags = {
      environment = "dev"
      project     = "demo"
    }
  }
}


# VIRTUAL NETWORK/SUBNETS

vnets = {
  v1 = {
    name                = "test_vnet"
    location            = "centralindia"
    resource_group_name = "test-rg"
    address_space       = ["10.0.0.0/16"]
    dns_servers         = ["10.0.0.4", "10.0.0.5"]
    tags = {
      environment = "Production"
    }

    subnet = [
      {
        name             = "frontend_subnet"
        address_prefixes = ["10.0.1.0/24"]
      },
      {
        name             = "backend_subnet"
        address_prefixes = ["10.0.2.0/24"]
      },
      {
        name             = "AzureBastionSubnet"
        address_prefixes = ["10.0.3.0/24"]
      }
    ]
  }
}


# PUBLIC IP

public_ips = {
  pip1 = {
    pip_name            = "test-pip1"
    resource_group_name = "test-rg"
    location            = "centralindia"
    allocation_method   = "Static"


    idle_timeout_in_minutes = 5
    ip_version              = "IPv4"
    sku                     = "Standard"
    sku_tier                = "Regional"
    tags = {
      environment = "dev"
      owner       = "xyz"
      project     = "FintechApp"
    }

  }


  pip2 = {
    pip_name            = "test-pip2"
    resource_group_name = "test-rg"
    location            = "centralindia"
    allocation_method   = "Static"


    idle_timeout_in_minutes = 5
    ip_version              = "IPv4"
    sku                     = "Standard"
    sku_tier                = "Regional"
    tags = {
      environment = "dev"
      owner       = "xyz"
      project     = "FintechApp"
    }
  }

  # pip3 = {
  #   pip_name            = "bastion-pip"
  #   location            = "centralindia"
  #   resource_group_name = "test-rg"
  #   allocation_method   = "Static"

  # }
}


# VIRTUAL MACHINES

vms = {
  vm1 = {
    nic_name            = "nic-frontend_vm"
    location            = "centralindia"
    resource_group_name = "test-rg"
    subnet_name         = "frontend_subnet"
    vnet_name           = "test_vnet"
    pip_name            = "test-pip1"
    key_vault_name      = "mykeyvault159624"
    secret_name         = "username1"
    secret_value        = "password1"


    ip_configuration = {
      "ip_config1" = {
        name = "internal"
        # subnet_id                     = data.azurerm_subnet.subnet.id
        # public_ip_address_id          = data.azurerm_public_ip.pip.id
        private_ip_address_allocation = "Dynamic"
      }
    }
    vm_name             = "frontendvm"
    resource_group_name = "test-rg"
    location            = "centralindia"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "vm1"
    admin_password      = "Sunny@12345"

    os_disk = {
      "disk1" = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }

    source_image_reference = {
      "sir1" = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
  }

  vm2 = {
    nic_name            = "nic-backend_vm"
    location            = "centralindia"
    resource_group_name = "test-rg"
    subnet_name         = "backend_subnet"
    vnet_name           = "test_vnet"
    pip_name            = "test-pip2"
    key_vault_name      = "mykeyvault159624"
    secret_name         = "username1"
    secret_value        = "password1"


    ip_configuration = {
      "ip_config1" = {
        name = "internal"
        # subnet_id                     = data.azurerm_subnet.subnet.id
        # public_ip_address_id          = data.azurerm_public_ip.pip.id
        private_ip_address_allocation = "Dynamic"
      }
    }
    vm_name             = "backendvm"
    resource_group_name = "test-rg"
    location            = "centralindia"
    vm_size             = "Standard_D2s_v3"
    admin_username      = "vm2"
    admin_password      = "Sunny@12345"

    os_disk = {
      "disk1" = {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
      }
    }

    source_image_reference = {
      "sir1" = {
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
      }
    }
  }
}


# KEYVAULT

key_vaults = {
  key1 = {
    kv_name                     = "mykeyvault159624"
    location                    = "centralindia"
    resource_group_name         = "test-rg"
    enabled_for_disk_encryption = true
    # tenant_id                   = data.azurerm_client_config.current.tenant_id
    soft_delete_retention_days = 7
    purge_protection_enabled   = false
    sku_name                   = "standard"
    access_policies = [
      {
        key_permissions = ["Get", "List"]
        secret_permissions = ["Get",
          "Set",
          "List",
          "Delete",
          "Recover",
          "Backup",
          "Restore",
        "Purge"]
        storage_permissions = ["Get", "List"]
      }
    ]

  }
}


# KEYVAULT SECRETS

kvsecs = {
  kvsec1 = {
    kv_name      = "mykeyvault159624"
    rg_name      = "test-rg"
    secret_name  = "username1"
    secret_value = "kashiff@admin"
  }

  kvsec2 = {
    kv_name      = "mykeyvault159624"
    rg_name      = "test-rg"
    secret_name  = "password1"
    secret_value = "kashiff@123456789"
  }
}


# NETWORK SECURITY GROUP

nsgs = {
  nsg1 = {
    nsg_name            = "nsg1"
    location            = "centralindia"
    resource_group_name = "test-rg"
    subnet_name         = "frontend_subnet"
    vnet_name           = "test_vnet"

    tags = {
      environment = "dev"

    }

    security_rule = [
      {
        name      = "guard1"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"



        # optional
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]

  }


  nsg2 = {
    nsg_name            = "nsg2"
    location            = "centralindia"
    resource_group_name = "test-rg"
    subnet_name         = "backend_subnet"
    vnet_name           = "test_vnet"

    tags = {
      environment = "dev"

    }

    security_rule = [
      {
        name      = "guard2"
        priority  = 100
        direction = "Inbound"
        access    = "Allow"
        protocol  = "Tcp"



        # optional
        source_port_range          = "*"
        destination_port_range     = "*"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
      }
    ]
  }
}


# BASTION

datapip = {
  pip1 = {
    name                = "bastion-pip"
    resource_group_name = "test-rg"
  }
}

datasubnet = {
  bastion_sub = {
    name                 = "AzureBastionSubnet"
    virtual_network_name = "test_vnet"
    resource_group_name  = "test-rg"
  }
}

# bastion = {
#   bastion1 = {
#     bastion_name        = "bastion1"
#     location            = "centralindia"
#     resource_group_name = "test-rg"

#     pipid    = "pip1"        # Key match
#     subnetid = "bastion_sub" # Key match

#     ip_configuration = {
#       ipconfig1 = {
#         name = "config1"
#       }
#     }
#   }
# }


# SERVER

servers = {
  server1 = {
    name                         = "testserver98432"
    resource_group_name          = "test-rg"
    location                     = "centralindia"
    version                      = "12.0"
    administrator_login          = "server_username"
    administrator_login_password = "Kashif@1234567"
    minimum_tls_version          = "1.2"

    tags = {
      environment = "dev"

    }
  }
}


# DATABASE

databases = {
  db1 = {
    name                = "test-db"
    server_name         = "testserver98432"
    resource_group_name = "test-rg"
    collation           = "SQL_Latin1_General_CP1_CI_AS"
    license_type        = "LicenseIncluded"
    max_size_gb         = 2
    sku_name            = "S0"
    enclave_type        = "VBS"
  }
}


# AKS

aks = {
  aks1 = {
    name                = "test-aks"
    resource_group_name = "test2-rg"
    location            = "North Europe"
    dns_prefix          = "dns1"
    default_node_pool = [{
      name       = "default"
      node_count = 1
      vm_size    = "Standard_L2aos_v4"
    }]
    identity = [{
      type = "SystemAssigned"
    }]

  }
}


# ACR

acrs = {
  acr1 = {
    name                = "testacr01kash"
    resource_group_name = "test-rg"
    location            = "centralindia"
    sku                 = "Standard"
    admin_enabled       = false
  }
}







