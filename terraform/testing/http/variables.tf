variable "body" {
  type    = string
  default = ""
}

variable "method" {
  type        = string
  description = "Required: valid http method GET and POST currently supported"

  validation {
    condition     = contains(["GET", "POST"], var.method)
    error_message = format("wants: 'GET' or 'POST' got: %s", var.method)
  }
}

variable "uri" {
  type        = string
  description = "Required: valid path uri string starting with leading slash /"

  validation {
    condition     = can(regex("^/[a-zA-Z0-9_-]+(?:/[a-zA-Z0-9_-]+)*$", var.uri)) && !endswith(var.uri, "/")
    error_message = format("wants: /?x/y/?z where xy is optional got: %s", var.method)
  }
}

variable "endpoint" {
  type        = string
  description = "Required: valid url string starting with leading slash https://"

  validation {
    condition     = can(regex("^https://(?:[a-zA-Z0-9-]+\\.)?[a-zA-Z0-9-]+(?:\\.[a-zA-Z]{2,})+$", var.endpoint)) && !endswith(var.uri, "/")
    error_message = format("wants: https://x?.y.z where x is optional got: %s", var.method)
  }
}
