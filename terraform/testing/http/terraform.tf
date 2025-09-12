terraform {
  required_providers {
    http = {
      source  = "hashicorp/http"
      version = "3.5.0"
    }
    assert = {
      source  = "hashicorp/assert"
      version = "0.16.0"
    }
  }
}

provider "assert" {}
provider "http" {}
