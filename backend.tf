terraform {
  backend "azurerm" {
    resource_group_name  = "aksResourceGroup"
    storage_account_name = "storageaccountfmr"
    container_name       = "containerfmr"
    key                  = "terraform.tfstate"
  }
}