########################################################################
# example: create files using `count`
########################################################################
variable "filename_for_count" {
  type        = string
  description = "Filename to use for `count` example."
  default     = "example"

  validation {
    condition     = length(var.filename_for_count) > 0
    error_message = "Filenames must be at least 1 character."
  }
}

########################################################################
# example: create files using `for_each`
########################################################################
variable "server_regions" {
  type        = map(list(string))
  description = "Server Regions to use for `for_each` example."

  default = {
    eu = [
      "eu-north-1",
      "eu-west-2",
    ],

    us = [
      "us-east-1",
      "us-west-2",
    ],

    ap = [
      "ap-northeast-1",
      "ap-southeast-2",
    ],
  }
}

variable "apt_repositories" {
  type = map(object({
    url = string
    key = string
  }))

  description = "APT Repositories to use for `for_each` example."

  default = {
    hashicorp = {
      url = "https://apt.releases.hashicorp.com"
      key = "https://apt.releases.hashicorp.com/gpg"
    },

    osquery = {
      url = "https://pkg.osquery.io/deb"
      key = "https://pkg.osquery.io/deb/osquery.gpg.key"
    }
  }
}
