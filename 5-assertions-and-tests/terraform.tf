terraform {
  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/bschaatsbergen/assert/0.8.0/docs
    assert = {
      source  = "bschaatsbergen/assert"
      version = "0.8.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/http/3.4.2/docs
    http = {
      source  = "hashicorp/http"
      version = "3.4.2"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.8.0"
}
