terraform {
  required_providers {
    restapi = {
      source = "Mastercard/restapi"
      version = ">= 1.20.0"
    }
    google = {
      source = "hashicorp/google"
      version = "6.8.0"
    }
  }
}
