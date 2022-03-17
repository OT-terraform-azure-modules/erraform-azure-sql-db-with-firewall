# common Variables
# Region
variable "regions" {
  description = "List of regions where resources will be created"
  type    = list(string)
}

variable "resource_group_name" {
  type = string
}

# variables for SQL Server

variable "sql_version" {
  description = "Version of SQL server"
  default = "12.0"
}

variable "sql_server_name" {
  type        = string
  description = "Name of SQL server"
  default     = "azurermsqlserver"
}

variable "administrator_login" {
  description = "Username for administrator login"
  type    = string
  default = "admin121212"
}

variable "administrator_login_password" {
  description = "Password for administrator login"
  type    = string
  default = "GBy6t7BaKbSktzRb"
}

# Variable for SQL fireWall
variable "sql_firewall_required" {
  type        = bool
  description = "If the SQL server is required or not"
  default     = true
}


variable "sql_firewall_name" {
  type        = string
  description = "Name of SQL firewall Rule"
  default     = "Azure_sql_firewall_rule_1122"
}

variable "start_ip_address" {
  type        = string
  description = "Start IP Address"
  default     = "0.0.0.0"
}

variable "end_ip_address" {
  type        = string
  description = "End IP Address"
  default     = "0.0.0.0"
}


# Variable for SQL Database

variable "sql_database_required" {
  type        = bool
  description = "If the SQL Database is required or not"
  default     = true
}

variable "azurerm_sql_database_name" {
  type        = list(string)
  description = "Name of sql database"
  default     = ["azurerm_sql_database_1122"]
}

variable "edition" {
  type        = string
  description = "database edition"
  default     = "Standard"
}

variable "requested_service_objective_name" {
  type        = string
  description = "requested_service_objective_name"
  default     = "S1"
}