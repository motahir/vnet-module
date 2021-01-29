resource "azurerm_resource_group" "rg" {
  name     = "${var.name}-${var.env}"
  location = "${var.location}"

  tags = {
    Environment = "${var.location}"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "${var.name}-${var.env}"
  resource_group_name = "${azurerm_resource_group.rg.name}"
  address_space       = "${var.address_space}"
  location            = "${azurerm_resource_group.rg.location}"

  tags = {
    Environment = "${var.location}"
  }
}

resource "azurerm_subnet" "sb" {
  count                = "${length(var.subnet_prefixes)}"
  name                 = "${element(var.subnet_names, count.index)}"
  resource_group_name  = "${azurerm_virtual_network.vnet.resource_group_name}"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  address_prefix       = "${element(var.subnet_prefixes, count.index)}"
  service_endpoints    = "${var.service_endpoints}"
}
