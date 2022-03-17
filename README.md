Azure SQL Database Terraform Module
=====================================

[![Opstree Solutions][opstree_avatar]][opstree_homepage]

[Opstree Solutions][opstree_homepage]

  [opstree_homepage]: https://opstree.github.io/
  [opstree_avatar]: https://img.cloudposse.com/150x150/https://github.com/opstree.png

Terraform module which creates SQL Server, SQL Firewall Rule and SQL Database.

This module provides you the functionality to create SQL Failover setup as well. In which we are creating required number of SQL Server, Sql Firewall and 1 SQL Database.

Note : For more information, you can check example folder.

Terraform versions
------------------
Terraform 0.14.9

```hcl
module "mysql_firewall" {
  source                           = "location of resource files"
  resource_group_name              = var.resource_group_name
  version                          = var.sql_version
  administrator_login              = var.administrator_login
  administrator_login_password     = var.administrator_login_password
  tags                             = local.tags
  name                             = var.sql_firewall_name
  server_name                      = element(azurerm_sql_server.main.*.name, count.index)
  start_ip_address                 = var.start_ip_address
  end_ip_address                   = var.end_ip_address
  location                         = element(var.regions, count.index)
  edition                          = var.edition
  requested_service_objective_name = var.requested_service_objective_name
}
```

**NOTE: You can also refer the variables.tf file under example directory to get the idea on variables define in module.**

Tags
----
* Tags are assigned to resources with name variable as prefix.
* Additial tags can be assigned by tags variables as defined above.
* Testing this.

Resources
------
| Name | Type |
|------|------|
| [azurerm_sql_server.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_server) | resource |
| [azurerm_sql_firewall_rule.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_firewall_rule) | resource |
| [azurerm_sql_database.main](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/sql_database) | resource |

Inputs
------
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| resource_group_name | Exesting Resource Group | `string` |  | yes |
| regions | Regions | `list(string)` |  | Yes |
| sql_version | Version of SQL | `string` |  | yes |
| sql_server_name | LName of SQL Server | `string` |  | yes |
| administrator_login | UserName to login | `string` |  | yes |
| administrator_login_password | Password to login | `string` |  | yes |
| sql_firewall_name | Name of the Firewall Rule | `string` |  | yes |
| start_ip_address | The starting IP address to allow through the firewall for this rule. | `string` |  | yes |
| end_ip_address | The ending IP address to allow through the firewall for this rule. | `string` |  | yes |
| azurerm_sql_database_name | Name of SQL database | `string` |  | yes |  
| edition | The edition of the database to be created. Applies only if create_mode is Default. Valid values are: Basic, Standard, Premium, DataWarehouse, Business, BusinessCritical, Free, GeneralPurpose, Hyperscale, Premium, PremiumRS, Standard, Stretch, System, System2, or Web. | `string` |  | No |
| requested_service_objective_name | The service objective name for the database. Valid values depend on edition and location and may include S0, S1, S2, S3, P1, P2, P4, P6, P11 and ElasticPool. You can list the available names with the cli: shell az sql db list-editions -l westus -o table.  | `string` |  | No |

Output
------
| Name | Description |
|------|-------------|
| sql_server_name | Name of SQL Servers |
| sql_server_id | Id's of SQL servers |
| sql_database_id | Id's of Database |

## Related Projects

Check out these related projects.

* [Resource Group](https://registry.terraform.io/modules/OT-terraform-azure-modules/resource-group/azure/latest)
* [SQL Failover](https://github.com/OT-terraform-azure-modules/terraform-azure-sql-failover)


### Contributor

|  [![Rishabh Sharma][rishabh_avatar]][rishabh_homepage]<br/>[Rishabh Sharma][rishabh_homepage] |
|---|

  [rishabh_homepage]: https://www.linkedin.com/in/rishabh-sharma-b4a0b3152
  [rishabh_avatar]: https://gitlab.com/uploads/-/system/user/avatar/9890362/avatar.png?width=400

