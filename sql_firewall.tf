# Creates SQL server firewall
resource "azurerm_sql_firewall_rule" "main" {
  count               = var.sql_firewall_required == true ? length(var.regions) : 0
  name                = var.sql_firewall_name
  resource_group_name = var.resource_group_name
  server_name         = element(azurerm_sql_server.main.*.name, count.index)
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}
