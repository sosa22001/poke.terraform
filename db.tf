
resource "azurerm_mssql_server" "sqlserver" {
  name                         = "dbserver-${var.project}-${var.environment}-${random_string.global_suffix.result}"
  resource_group_name          = azurerm_resource_group.rg.name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = "sql_admin"
  administrator_login_password = var.admin_sql_password

  tags = var.tags
}



//esta sería la base de datos:
resource "azurerm_mssql_database" "db" {
  name      = "${var.project}db-${random_string.global_suffix.result}"
  server_id = azurerm_mssql_server.sqlserver.id
  sku_name  = "S0"

  tags = var.tags
}