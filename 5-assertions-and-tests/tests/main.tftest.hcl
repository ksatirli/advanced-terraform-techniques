# see https://developer.hashicorp.com/terraform/language/tests
run "check_http_success" {
  # API Endpoint should report success on `plan` already, otherwise
  # there's no need to continue with `apply` or `destroy` operations
  command = plan

  assert {
    # use a custom provider function (`http_success`) to check for a 2xx status code
    # see https://registry.terraform.io/providers/bschaatsbergen/assert/latest/docs/functions/http_success
    condition     = provider::assert::http_success(data.http.api_endpoint.status_code)
    error_message = "API Endpoint must return a 2xx status code."
  }
}
