locals {
  url = "${var.endpoint}${var.uri}"
}

check "unique_name" {
  assert {
    condition     = can(regex("^https://(?:[a-zA-Z0-9-]+\\.)?[a-zA-Z0-9-]+(?:\\.[a-zA-Z]{2,})+/[a-zA-Z0-9_-]+(?:/[a-zA-Z0-9_-]+)*$", local.url))
    error_message = format("wants: valid url based on variable validation got: %s", local.url)
  }
}

data "http" "test" {
  url    = local.url
  method = var.method
  request_headers = {
    Accept = "application/json"
  }
  # Optional request body
  request_body = var.body
}
