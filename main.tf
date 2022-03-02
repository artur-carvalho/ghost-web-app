module "west-us-hub-01" {
  source                 = "./modules/hub"
  rg_name                = "poc-ghost-hub-rg01"
  location               = "westus2"
  vnet_address_space     = ["192.168.0.0/24"]
  default_subnet_address = ["192.168.0.0/26"]
  tags = {
    "Purporse"    = "Azure Assessment"
    "Application" = "Ghost"
  }
}

module "west-us-spoke-01" {
  source                 = "./modules/spoke"
  rg_name                = "poc-ghost-spoke-rg01"
  location               = "westus2"
  vnet_address_space     = ["192.168.0.0/24"]
  default_subnet_address = ["192.168.0.0/26"]
  tags = {
    "Purporse"    = "Azure Assessment"
    "Application" = "Ghost"
  }
}