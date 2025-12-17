module "rg" {
    source = "../../modules/azurerm_resource_group"

    rg = var.rg
} 


module "sa" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_storage_account"
    sgs = var.sgs
  
}


module "vnet" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_vnet"
    vnets = var.vnets
  
}

module "public_ips" {
    depends_on = [ module.rg ]
    source = "../../modules/public_ip"
    public_ips = var.public_ips
  
}

module "vm" {
    depends_on = [ module.keyvault, module.keyvault_secret, module.rg, module.vnet, module.public_ips ]
    source = "../../modules/azure_virtual_machine"
    vms = var.vms
  
}

module "keyvault" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_keyvault"
    key_vaults = var.key_vaults
  
}

module "keyvault_secret" {
    depends_on = [ module.keyvault ]
    source = "../../modules/azurerm_keyvault_secret"
    kvsecs = var.kvsecs
  
}

module "nsg" {
    depends_on = [ module.rg, module.vnet, module.vm ]
    source = "../../modules/azurerm_network_security_group"
    nsgs = var.nsgs
  
}



# module "bastion" {
#     depends_on = [ module.rg, module.vnet, module.public_ips]
#     source = "../../modules/azurerm_bastion"
#     bastion = var.bastion
#     datapip = var.datapip
#     datasubnet = var.datasubnet
  
# } 



module "sql_server" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_sql_sever"
    servers = var.servers
  
}

module "database" {
  depends_on = [ module.rg, module.sql_server ]
  source = "../../modules/azurerm_database"
  databases = var.databases
  
}

module "aks" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_aks"
    aks = var.aks
}


module "acr" {
    depends_on = [ module.rg ]
    source = "../../modules/azurerm_acr"
    acrs = var.acrs

}




