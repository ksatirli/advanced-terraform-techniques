variable "api_endpoint" {
  type        = string
  description = "The URL of the API Endpoint."

  # use `https` when available and ensure system trust stores are up-to-date
  default = "https://api.releases.hashicorp.com/v1/products"
}

variable "api_endpoint_content_type" {
  type        = string
  description = "The Content-Type of the API Endpoint."

  # see https://releases.hashicorp.com/docs/api/v1/
  default = "application/vnd+hashicorp.releases-api.v1+json"
}
