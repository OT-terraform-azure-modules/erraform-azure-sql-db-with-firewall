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
