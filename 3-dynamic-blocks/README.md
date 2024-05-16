# `3-dynamic-blocks`

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
| docker_image | The Docker image to use | `string` | no |
| docker_volumes | List of Docker Volumes to mount. | <pre>list(object({<br>    source      = string<br>    destination = string<br>    read_only   = bool<br>  }))</pre> | no |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
