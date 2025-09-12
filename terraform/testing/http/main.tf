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

variable "body" {}
variable "method" {}
variable "uri" {}
variable "endpoint" {}

data "http" "test" {
  url    = "${var.endpoint}${var.uri}"
  method = var.method
  request_headers = {
    Accept = "application/json"
  }
  # Optional request body
  request_body = var.body
}
