# `5-assertions-and-tests`

## Steps

```shell
# initialize Terraform
terraform init -upgrade

# print execution plan and note that there is nothing to do
terraform plan

# apply the configuration
terraform apply

# run the tests
terraform test
```

## Terraform Configuration

<!-- BEGIN_TF_DOCS -->
### Inputs

| Name | Description | Type | Required |
|------|-------------|------|:--------:|
| api_endpoint | The URL of the API Endpoint. | `string` | no |
| api_endpoint_content_type | The Content-Type of the API Endpoint. | `string` | no |

### Outputs

No outputs.
<!-- END_TF_DOCS -->
