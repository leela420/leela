
resource "azurerm_resource_group" "resource" {
  for_each =  var.rg
name     = each.key
  location = each.value

}


resource "azurerm_storage_account" "storage" {
    depends_on = [ azurerm_resource_group.resource ]
    for_each = var.storage_ac
  name                     = each.value.storageaccount
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type
}