# Provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.46.0"
    }
  }
}

provider "azurerm" {
  features {}
}

# fatching resource group name 
data "azurerm_resources" "az-rg" {
  resource_group_name = var.resource_group_name
}

module "mysql_firewall" {
  source                = "../../"
  resource_group_name   = data.azurerm_resources.az-rg.resource_group_name
  sql_database_required = var.sql_database_required
  regions               = var.regions
}

module "sql_failover" {
  source                        = "git::https://github.com/OT-terraform-azure-modules/terraform-azure-sql-failover.git?ref=main"
  failover_group_name           = var.failover_group_name
  resource_group_name           = data.azurerm_resources.az-rg.resource_group_name
  primary_server_name           = module.mysql_firewall.sql_server_name[0]
  sql_failover_db_id            = module.mysql_firewall.sql_database_id
  secondary_server_id           = module.mysql_firewall.sql_server_id[1]
  failover_policy_mode          = "Automatic"
  failover_policy_grace_minutes = "60"
}
