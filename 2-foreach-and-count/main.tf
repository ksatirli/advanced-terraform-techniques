########################################################################
# example: create files using `count`
########################################################################

# see https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "using_count" {
  # how many files to create
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/count
  count = 5

  content  = "My index is ${count.index}."
  filename = "../generated/using_count/${var.filename_for_count}-${count.index}.txt"
}

########################################################################
# example: create files using `for_each`
########################################################################

# see https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "using_for_each_with_keys" {
  # see https://developer.hashicorp.com/terraform/language/meta-arguments/for_each
  for_each = var.server_regions

  content  = "My region is `${each.key}`."
  filename = "../generated/using_for_each_with_keys/${each.key}.txt"
}

# see https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "using_for_each_with_values" {
  for_each = var.server_regions

  # print contents of region list
  content  = join("\n", each.value)
  filename = "../generated/using_for_each_with_values/${each.key}.txt"
}

# see https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "using_nested_for_each" {
  for_each = var.apt_repositories

  # print contents of nested keys
  content = <<-EOT
    URL: ${each.value.url}
    Key: ${each.value.key}
  EOT

  filename = "../generated/using_nested_for_each/${each.key}.txt"
}

# see https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "using_nested_for_each_with_templates" {
  for_each = var.apt_repositories

  # render template with contents of nested keys
  # see https://developer.hashicorp.com/terraform/language/functions/templatefile
  content = templatefile("${path.module}/apt-repo-script.tftpl.sh", {
    REPO_KEY        = each.value.key
    REPO_IDENTIFIER = each.key
    REPO_URL        = each.value.url
  })

  filename = "../generated/using_nested_for_each_with_templates/${each.key}.sh"
}
