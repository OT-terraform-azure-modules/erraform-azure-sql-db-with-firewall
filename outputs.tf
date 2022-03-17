# server name
output "sql_server_name" {
  value = azurerm_sql_server.main.*.name
}

output "sql_server_id" {
  value = azurerm_sql_server.main.*.id
}

output "sql_database_id" {
  value = azurerm_sql_database.main.*.id
}