### TO DO ####
# module "west-eu-spoke-01" {
#   source                 = "./modules/spoke"
#   rg_name                = "poc-ghost-spoke-rg01"
#   location               = "westeurope"
#   vnet_address_space     = ["192.168.4.0/24"]
#   default_subnet_address = ["192.168.4.0/26"]
#   app_gw_subnet          = ["192.168.4.64/26"]
#   hub_rg_name            = module.west-eu-hub-01.rg_name
#   hub_vnet_name          = module.west-eu-hub-01.vnet_name
#   hub_vnet_id            = module.west-eu-hub-01.vnet_id
#   tags = {
#     "Purporse"    = "Azure Assessment"
#     "Application" = "Ghost"
#   }
# }

# module "ghost-aks-01" {
#   source          = "./modules/aks"
#   rg_name         = module.west-eu-spoke-01.rg_name
#   location        = module.west-eu-spoke-01.rg_location
#   appgw_subnet_id = module.west-eu-spoke-01.appgw_subnet_id
#   la_workspace_id = module.west-eu-hub-01.la_workspace_id
#   environment     = "dev"
#   tags = {
#     "Purporse"    = "Azure Assessment"
#     "Application" = "DR - Ghost"
#   }
# }