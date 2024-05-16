terraform {
  # see https://developer.hashicorp.com/terraform/language/settings#specifying-provider-requirements
  required_providers {
    # see https://registry.terraform.io/providers/kreuzwerker/docker/3.0.2/docs
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }

  # see https://developer.hashicorp.com/terraform/language/settings#specifying-a-required-terraform-version
  required_version = ">= 1.8.0"
}
