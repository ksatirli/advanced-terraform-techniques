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
