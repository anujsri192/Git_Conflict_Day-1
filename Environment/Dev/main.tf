module "resource_group" {
  source = "../../Modules/Resource_group"
  rgs    = var.resource_groups

}

module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../Modules/Virtual_network"
  vnetvr     = var.virtual_networks

}

module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../Modules/Subnet"
  snet       = var.subnet

}
