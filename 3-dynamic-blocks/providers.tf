# see https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs
provider "docker" {
  host = "unix:///var/run/docker.sock"

  # since we're using the local Docker daemon, we don't need to specify a registry
  # registry_auth {
  #  address = "docker-registry.svcs.dev"
  #
  #  # see https://developer.hashicorp.com/terraform/language/functions/pathexpand
  #  config_file = pathexpand("~/.docker/config.json")
  # }
}
