########################################################################
# example: pull Docker Image
########################################################################
variable "docker_image" {
  type        = string
  description = "The Docker image to use"

  # see https://hub.docker.com/_/nginx/tags?name=stable-alpine3.19
  default = "nginx:stable-alpine3.19"
}

variable "docker_volumes" {
  type = list(object({
    source      = string
    destination = string
    read_only   = bool
  }))

  description = "List of Docker Volumes to mount."

  default = [
    {
      source      = "/tmp/data"
      destination = "/app/data"
      read_only   = false
    },
    {
      source      = "/tmp/static"
      destination = "/app/static"
      read_only   = true
    }
  ]
}
