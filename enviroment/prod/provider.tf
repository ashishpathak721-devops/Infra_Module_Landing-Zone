terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.80"

    }
  }
  backend "azurerm" { 
   resource_group_name = "ashish"
   storage_account_name = "ashishstorage721"
   container_name = "prod"
   key = "tfstate"       
  }

}
provider "azurerm" {
  features {}
}