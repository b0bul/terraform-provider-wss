
data "http" "test" {
  url    = "${var.endpoint}${var.uri}"
  method = var.method
  request_headers = {
    Accept = "application/json"
  }
  # Optional request body
  request_body = var.body
}
