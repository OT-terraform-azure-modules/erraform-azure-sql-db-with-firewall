resource "azurerm_sql_database" "main" {
  count                            = var.sql_database_required == true ? length(var.azurerm_sql_database_name) : 0
  name                             = "${var.azurerm_sql_database_name}-${count.index}"
  resource_group_name              = var.resource_group_name
  location                         = element(var.regions, count.index)
  server_name                      = azurerm_sql_server.main[0].name
  edition                          = var.edition
  requested_service_objective_name = var.requested_service_objective_name
  tags                             = local.tags
}
