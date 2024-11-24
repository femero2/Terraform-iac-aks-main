terraform {
  backend "azurerm" {
    resource_group_name  = "aksResourceGroup"
    storage_account_name = "storageaccountpvb"
    container_name       = "containerpvb"
    key                  = "terraform.tfstate"
  }
}