# `1-variable-validation`

## Steps

```shell
# initialize Terraform
terraform init -ugprade

# print execution plan
terraform plan

# apply the configuration
terraform apply
```

Then: open `variables.tf` and change `list_of_filenames` to an invalid value (e.g. `list_of_filenames = "file1.txt"`)

```shell
# attempt to print execution plan again
terraform plan
```

## Terraform Configuration

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| complex_map | Complex Map with Deployment Information | <pre>object({<br>    provider         = string<br>    region           = string<br>    enabled          = bool<br>    failover_regions = list(string)<br>  })</pre> | no |
| list_of_filenames | List of Strings of filenames to create. | `list(string)` | no |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
