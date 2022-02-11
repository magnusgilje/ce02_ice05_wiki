Log analytics is a method by which you are able to see logging information on the code you are using within your cloud provider. For example, with this code you will be able to see on Azure various analytics such as any bugs in your code that appear when run, when it is called, when queries are made etc.

Log analytics uses data to call information from existing data resources, and then to create a resource within terraform which can run the data analytics. These follow the same standard formats as the data and resource functions seen in other files and can be found on the terraform.io manual with set variables.

### Example code

```
data "azurerm_resource_group" "analytics" {
  name = "rg-ce02-hub"
}
data "azurerm_log_analytics_workspace" "analytics" {
  name                = "lace02hub"
  resource_group_name = data.azurerm_resource_group.analytics.name
}
# This piece of data connects to an existing log analytics 
data "azurerm_monitor_diagnostic_categories" "storage" {
  resource_id = azurerm_storage_account.hugo_iac_sa.id
}

resource "azurerm_monitor_diagnostic_setting" "storage" {
  name                       = "gar01_diagnostics"
  target_resource_id         = azurerm_storage_account.hugo_iac_sa.id
  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.analytics.id
  dynamic "metric" {
    iterator = metric_category
    for_each = data.azurerm_monitor_diagnostic_categories.storage.metrics
    content {
      category = metric_category.value
      enabled  = true
      retention_policy {
        enabled = true
        days    = 7 #var.log_retention_days
      }
    }
  }
}
```