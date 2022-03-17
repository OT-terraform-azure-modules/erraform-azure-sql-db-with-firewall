variable "regions" {
  description = "List of regions where resources will be created"
  type        = list(string)
  default     = ["East US", "West US"]
}

variable "resource_group_name" {
  default = "rishabh-rg"
}

variable "sql_database_required" {
  type        = bool
  description = "If the SQL server is required or not"
  default     = true
}

# Failover Vars

variable "failover_group_name" {
  type        = string
  description = "Name of failover group"
  default     = "testfailovermysql"
}