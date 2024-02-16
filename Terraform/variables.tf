variable "random_integer_min" {
  type        = number
  description = "Minimal random integer"

}

variable "random_integer_max" {
  type        = number
  description = "Maximum random integer"

}

variable "resource_group_name" {
  type        = string
  description = "Resource group name"
}

variable "resource_group_location" {
  type        = string
  description = "Resource group name"
}

variable "app_service_plan_name" {
  type        = string
  description = "App service plan name"
}

variable "app_service_plan_os_type" {
  type        = string
  description = "App service plan - OS type"
}

variable "app_service_plan_sku_name" {
  type        = string
  description = "App service plan - SKU name"
}

variable "app_service_name" {
  type        = string
  description = "App service name"
}

variable "connection_string_name" {
  type        = string
  description = "App service connection string name"
}

variable "connection_string_type" {
  type        = string
  description = "App service connection string type"
}

variable "sql_server_name" {
  type        = string
  description = "SQL server name"
}

variable "sql_server_version" {
  type        = string
  description = "SQL server verion"
}

variable "sql_admin_login" {
  type        = string
  description = "SQL Admin login"
}

variable "sql_admin_password" {
  type        = string
  description = "SQL Admin password"
}

variable "sql_database_name" {
  type        = string
  description = "SQL database name"
}

variable "sql_database_collation" {
  type        = string
  description = "SQL database collation"
}

variable "sql_database_max_size_gb" {
  type        = number
  description = "SQL database max size GB"
}

variable "sql_database_sku_name" {
  type        = string
  description = "SQL database SKU name"
}

variable "sql_database_zone_redundant" {
  type        = bool
  description = "SQL database zone redundant"
}

variable "firewall_rule_name" {
  type        = string
  description = "Firewall rule name"
}

variable "firewall_rule_start_ip_address" {
  type        = string
  description = "Firewall rule start IP address"
}

variable "firewall_rule_end_ip_address" {
  type        = string
  description = "Firewall rule end IP address"
}


variable "repo_URL" {
  type        = string
  description = "Github Repo URL"
}

variable "repo_branch" {
  type        = string
  description = "Github Repo branch"
}

variable "source_control_manual_integration" {
  type        = bool
  description = "Use source control manual integration"
}

