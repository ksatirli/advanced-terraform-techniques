# pull Docker Image
# see https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "docker_image" "main" {
  name         = var.docker_image
  keep_locally = true
}

########################################################################
# example: run Docker Container using non-dynamic Volumes
########################################################################

# see https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "non_dynamic" {
  image = docker_image.main.image_id

  # replace `:` character in Docker Image name
  # see https://developer.hashicorp.com/terraform/language/functions/replace
  name = "${replace(var.docker_image, ":", "")}-non-dynamic"

  # see https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container#nestedblock--volumes
  volumes {
    # target first volume
    container_path = var.docker_volumes[0].destination
    host_path      = var.docker_volumes[0].source
    read_only      = var.docker_volumes[0].read_only
  }

  # see https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container#nestedblock--volumes
  volumes {
    # target second volume
    container_path = var.docker_volumes[1].destination
    host_path      = var.docker_volumes[1].source
    read_only      = var.docker_volumes[1].read_only
  }

  ports {
    internal = 80
    external = 8000
  }
}

########################################################################
# example: run Docker Container using dynamic Volumes
########################################################################

# see https://registry.terraform.io/providers/kreuzwerker/docker/latest/docs/resources/container
resource "docker_container" "dynamic" {
  image = docker_image.main.image_id

  # replace `:` character in Docker Image name
  # see https://developer.hashicorp.com/terraform/language/functions/replace
  name = "${replace(var.docker_image, ":", "")}-dynamic"

  # see https://developer.hashicorp.com/terraform/language/expressions/dynamic-blocks
  dynamic "volumes" {
    # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
    for_each = var.docker_volumes

    content {
      container_path = volumes.value.destination
      host_path      = volumes.value.source
      read_only      = volumes.value.read_only
    }
  }

  ports {
    internal = 80
    external = 8080
  }
}
