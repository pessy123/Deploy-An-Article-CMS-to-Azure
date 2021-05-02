# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = ">= 2.26"
    }
  }

  required_version = ">= 0.14.9"
  backend "remote" {
    organization = "Udacity-anyulled"
    workspaces {
      name = "Project-one"
    }
  }

}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "resource-group" {
  name = "udacity-project-1"
  location = var.location

  tags = var.tags
}

resource "azurerm_sql_server" "server" {
  administrator_login = "udacity"
  administrator_login_password = "udacity1234"
  location = var.location
  name = "server"
  resource_group_name = azurerm_resource_group.resource-group.name
  version = "12.0"

  tags = var.tags
}

resource "azurerm_sql_database" "database" {
  location = var.location
  name = "database"
  resource_group_name = azurerm_resource_group.resource-group.name
  server_name = azurerm_sql_server.server.name
  edition = "Basic"

  tags = var.tags

}

resource "azurerm_storage_account" "storage" {
  account_replication_type = "LRS"
  account_tier = "Standard"
  location = var.location
  name = "storage"

  resource_group_name = azurerm_resource_group.resource-group.name

  tags = var.tags
}

resource "azurerm_function_app" "my-function" {
  app_service_plan_id = azurerm_app_service_plan.service-plan.id
  location = var.location
  name = "udacity-function"
  resource_group_name = azurerm_resource_group.resource-group.name
}

resource "azurerm_app_service_plan" "service-plan" {
  name                = "azure-functions-test-service-plan"
  location            = azurerm_resource_group.resource-group.location
  resource_group_name = azurerm_resource_group.resource-group.name

  sku {
    tier = "Standard"
    size = "S1"
  }
}