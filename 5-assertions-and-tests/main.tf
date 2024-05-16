########################################################################
# example: assertion with a `postcondition` block
########################################################################
data "http" "api_endpoint" {
  # use `https` when available and ensure system trust stores are up-to-date
  url = var.api_endpoint

  retry {
    # retry connection twice more after failing once
    attempts = 3

    # add delay intervals as needed
  }

  # explicitly specify the method for clarity
  method = "GET"

  # see https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http#request_headers
  request_headers = {
    Accept = var.api_endpoint_content_type

    # add additional accept headers as needed
  }

  lifecycle {
    # add post condition check to verify response is served with acceptable status code
    # note that `self.` is only available to `postcondition`, not to `precondition`
    # see https://developer.hashicorp.com/terraform/language/expressions/custom-conditions#preconditions-and-postconditions
    postcondition {
      condition = contains([
        200, // OK
        304, // Not Modified
      ], self.status_code)

      error_message = "Status Code must be one of 200 or 304."
    }

    # add post condition check to verify response is actually JSON
    postcondition {
      condition     = can(jsondecode(self.response_body))
      error_message = "Response must be valid JSON."
    }
  }
}

########################################################################
# example: assertion with a `check` block
########################################################################
// see https://developer.hashicorp.com/terraform/language/expressions/custom-conditions#checks-with-assertions
check "website" {
  data "http" "api_endpoint_check" {
    url = var.api_endpoint

    retry {
      # retry connection twice more after failing once
      attempts = 3

      # add delay intervals as needed
    }

    # explicitly specify the method for clarity
    method = "GET"

    # see https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http#request_headers
    request_headers = {
      Accept = var.api_endpoint_content_type
    }
  }

  assert {
    condition     = data.http.api_endpoint_check.status_code == 200
    error_message = "${data.http.api_endpoint_check.url} returned an unhealthy status code"
  }
}
