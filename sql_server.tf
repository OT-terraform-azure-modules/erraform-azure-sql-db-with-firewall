# Creating SQL server
resource "azurerm_sql_server" "main" {
  count                        = length(var.regions)
  name                         = "${var.sql_server_name}-${count.index}"
  resource_group_name          = var.resource_group_name
  location                     = element(var.regions, count.index)
  version                      = var.sql_version
  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_login_password
  tags                         = local.tags
}