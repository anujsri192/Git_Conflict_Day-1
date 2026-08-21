resource_groups = {
  ra1 = {
    name       = "rg1101"
    location   = "Japan East"
    managed_by = "krishna"
  }
  ra2 = {
    name       = "rg1102"
    location   = "Japan West"
    managed_by = "ram"
  }
  ra3 = {
    name       = "rg-sohan"
    location   = "Japan West"
    managed_by = "ram"
}
virtual_networks = {
  vnet1 = {
    name                = "vnet9743"
    location            = "Japan West"
    resource_group_name = "rg1102"
    address_space       = ["10.0.0.0/16"]
  }
  vnet2 = {
    name                = "vnet964"
    location            = "Japan West"
    resource_group_name = "rg1101"
    address_space       = ["10.0.0.0/16"]
  }
}
subnet = {
  subnet1 = {
    name                 = "sub9857"
    resource_group_name  = "rg1102"
    virtual_network_name = "vnet9743"
    address_prefixes     = ["10.0.1.0/24"]
  }
  subnet2 = {
    name                 = "sub94687"
    resource_group_name  = "rg1101"
    virtual_network_name = "vnet964"
    address_prefixes     = ["10.0.1.0/24"]
  }
}
