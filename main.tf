                                                                                                      File: main.tf                                                                                                            
resource "azurerm_resource_group" "rg" {
  name     = "rg_np_security_tf"
  location = "australiaeast"
}

resource "azurerm_public_ip" "example" {
  name                = "public_ip_np_lb"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  allocation_method   = "Static"

}

resource "azurerm_lb" "lb" {
  name                = "lb_np_tf"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PubliIPAddress"
    public_ip_address_id = azurerm_public_ip.example.id

  }

}


resource "azurerm_lb_backend_address_pool" "example" {
  loadbalancer_id = azurerm_lb.lb.id
  name            = "BackendAddresspool"
}









