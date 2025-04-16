

# Cuenta de almacenamiento principal
resource "azurerm_storage_account" "saccount" {
  name                     = "sa${var.project}${var.environment}${random_string.global_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

# Cuenta de almacenamiento para Function App
resource "azurerm_storage_account" "saccount2" {
  name                     = "safunction${var.environment}${random_string.global_suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  tags                     = var.tags
}

# Contenedor de blobs
resource "azurerm_storage_container" "contenedorarchivos" {
  name                  = "reportes"
  container_access_type = "private"
  storage_account_id   = azurerm_storage_account.saccount.id
}

# Cola de mensajes
resource "azurerm_storage_queue" "q1" {
  name                  = "requests"
  storage_account_name = azurerm_storage_account.saccount.name
}
