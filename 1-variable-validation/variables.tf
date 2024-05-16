########################################################################
# example: basic validation using `type` definition
########################################################################
variable "complex_map" {
  type = object({
    provider         = string
    region           = string
    enabled          = bool
    failover_regions = list(string)
  })

  description = "Complex Map with Deployment Information"

  default = {
    provider = "aws"
    region   = "eu-central-1"
    enabled  = true

    failover_regions = [
      "eu-north-1",
      "eu-west-2",
    ]
  }
}

########################################################################
# example: inline validation using `validation` definition
########################################################################
variable "list_of_filenames" {
  type        = list(string)
  description = "List of Strings of filenames to create."

  default = [
    "README.ast",
    "README.md",
    "README.txt",
  ]

  validation {
    condition     = length(var.list_of_filenames) > 0 && length(var.list_of_filenames) < 4
    error_message = "List of filenames must be between 1 and 3."
  }

  validation {
    # check if ANY of these validations is truthy
    # see https://developer.hashicorp.com/terraform/language/functions/anytrue
    condition = anytrue([
      # check if list of filenames includes a file with a specific name
      # see https://developer.hashicorp.com/terraform/language/functions/contains
      contains(var.list_of_filenames, "README.ast"),
      contains(var.list_of_filenames, "README.amd"),
      contains(var.list_of_filenames, "README.txt"),
    ])

    error_message = "List of Filenames must include at least one of `README.ast`, `README.md`, or `README.txt`."
  }
}
