terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.90.0"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "random_integer" "ri" {
  min = var.random_integer_min
  max = var.random_integer_max
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}-${random_integer.ri.result}"
  location = var.resource_group_location
}



resource "azurerm_service_plan" "sp" {
  name                = "${var.app_service_plan_name}-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = var.app_service_plan_os_type
  sku_name            = var.app_service_plan_sku_name
}

resource "azurerm_linux_web_app" "wa" {
  name                = "${var.app_service_name}-${random_integer.ri.result}"
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_service_plan.sp.location
  service_plan_id     = azurerm_service_plan.sp.id
  connection_string {
    name  = var.connection_string_name
    type  = var.connection_string_type
    value = "Data Source=tcp:${azurerm_mssql_server.mssql.fully_qualified_domain_name},1433;Initial Catalog=${azurerm_mssql_database.db.name};User ID=${azurerm_mssql_server.mssql.administrator_login};Password=${azurerm_mssql_server.mssql.administrator_login_password};Trusted_Connection=False; MultipleActiveResultSets=True;"
  }

  site_config {
    application_stack {
      dotnet_version = "6.0"
    }
    always_on = false
  }
}

resource "azurerm_mssql_server" "mssql" {
  name                         = "${var.sql_server_name}-${random_integer.ri.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = azurerm_resource_group.rg.location
  version                      = var.sql_server_version
  administrator_login          = var.sql_admin_login
  administrator_login_password = var.sql_admin_password
}

resource "azurerm_mssql_database" "db" {
  name           = "${var.sql_database_name}${random_integer.ri.result}"
  server_id      = azurerm_mssql_server.mssql.id
  collation      = var.sql_database_collation
  max_size_gb    = var.sql_database_max_size_gb
  sku_name       = var.sql_database_sku_name
  zone_redundant = var.sql_database_zone_redundant
}

resource "azurerm_mssql_firewall_rule" "fwr" {
  name             = "${var.firewall_rule_name}-${random_integer.ri.result}"
  server_id        = azurerm_mssql_server.mssql.id
  start_ip_address = var.firewall_rule_start_ip_address
  end_ip_address   = var.firewall_rule_end_ip_address
}


resource "azurerm_app_service_source_control" "ghr" {
  app_id                 = azurerm_linux_web_app.wa.id
  repo_url               = var.repo_URL
  branch                 = var.repo_branch
  use_manual_integration = var.source_control_manual_integration
}