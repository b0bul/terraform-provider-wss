variables {
  endpoint    = "https://yolo-son.free.beeceptor.com"
  module_path = "."
}

run "speech_wss_t1" {
  module {
    source = "./testing/http"
  }
  variables {
    // allow https:// blob endpoint
    body     = file("${var.module_path}/speech/t.wav")
    endpoint = var.endpoint
    uri      = "/status"
    method   = "GET"
    expect = {
      status_code = 200
      json = {
        status = "Awesome!"
      }
    }
  }
  assert {
    condition     = provider::assert::http_success(data.http.test.status_code)
    error_message = "boo from t1!"
  }
  assert {
    condition     = jsondecode(data.http.test.response_body) == var.expect.json
    error_message = "boo from t1!"
  }
}

run "speech_wss_t2" {
  module {
    source = "./testing/http"
  }
  variables {
    body     = file("${var.module_path}/speech/t.wav")
    endpoint = var.endpoint
    uri      = "/analyze"
    method   = "POST"
    expect = {
      status_code = 201
      json = {
        message = "hey yo!"
      }
    }
  }
  assert {
    condition     = provider::assert::http_success(data.http.test.status_code)
    error_message = "boo from t2!"
  }
  assert {
    condition     = jsondecode(data.http.test.response_body) == var.expect.json
    error_message = "boo from t2!"
  }
}

