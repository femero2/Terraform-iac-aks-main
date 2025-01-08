terraform {
  backend "azurerm" {
    resource_group_name  = "aksResourceGroup"
    storage_account_name = "storageaccountfmr2"
    container_name       = "containerfmr2"
    key                  = "terraform.tfstate"
  }
}
