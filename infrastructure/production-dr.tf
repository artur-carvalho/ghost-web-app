# # DR Spoke
# module "west-us-spoke-prd-02-dr" {
#   source                 = "./modules/spoke"
#   rg_name                = "poc-ghost-dr-spoke-rg02"
#   location               = "westus2"
#   vnet_address_space     = ["192.168.3.0/24"]
#   default_subnet_address = ["192.168.3.0/26"]
#   app_gw_subnet          = ["192.168.3.64/26"]
#   hub_rg_name            = module.west-eu-hub-01.rg_name
#   hub_vnet_name          = module.west-eu-hub-01.vnet_name
#   hub_vnet_id            = module.west-eu-hub-01.vnet_id
#   tags = {
#     "Purporse"    = "Azure Assessment"
#     "Application" = "DR - Ghost"
#   }
# }

# module "ghost-aks-01" {
#   source          = "./modules/aks"
#   rg_name         = module.west-us-spoke-prd-02-dr.rg_name
#   location        = module.west-us-spoke-prd-02-dr.rg_location
#   appgw_subnet_id = module.west-us-spoke-prd-02-dr.appgw_subnet_id
#   la_workspace_id = module.west-eu-hub-01.la_workspace_id
#   environment     = "dr"
#   tags = {
#     "Purporse"    = "Azure Assessment"
#     "Application" = "DR - Ghost"
#   }
# }