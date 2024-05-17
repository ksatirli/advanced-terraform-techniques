# `2-foreach-and-count`

## Steps

```shell
# initialize Terraform
terraform init -upgrade

# print execution plan
terraform plan

# apply the configuration
terraform apply

# inspect generated files
open ../generated
```

## Terraform Configuration

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| apt_repositories | APT Repositories to use for `for_each` example. | <pre>map(object({<br>    url = string<br>    key = string<br>  }))</pre> | no |
| filename_for_count | Filename to use for `count` example. | `string` | no |
| server_regions | Server Regions to use for `for_each` example. | `map(list(string))` | no |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
