random_integer_min                = 10000
random_integer_max                = 99999
resource_group_name               = "WatchlistRg"
resource_group_location           = "North Europe"
app_service_plan_name             = "watchlist-plan"
app_service_plan_os_type          = "Linux"
app_service_plan_sku_name         = "F1"
app_service_name                  = "watchlist-app"
connection_string_name            = "DefaultConnection"
connection_string_type            = "SQLAzure"
sql_server_name                   = "sql-server"
sql_server_version                = "12.0"
sql_admin_login                   = "4dm1n157r4t0r"
sql_admin_password                = "53cr37_p455w0rd"
sql_database_name                 = "watchlist-database"
sql_database_collation            = "SQL_Latin1_General_CP1_CI_AS"
sql_database_max_size_gb          = 2
sql_database_sku_name             = "S0"
sql_database_zone_redundant       = false
firewall_rule_name                = "WatchlistFirewallRule12"
firewall_rule_start_ip_address    = "0.0.0.0"
firewall_rule_end_ip_address      = "0.0.0.0"
repo_URL                          = "https://github.com/viktor-dimitrov/azure-terraform-test6"
repo_branch                       = "main"
source_control_manual_integration = false