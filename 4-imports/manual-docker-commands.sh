#!/bin/sh

# see https://hub.docker.com/_/alpine/tags?name=20240329
DOCKER_IMAGE="alpine:20240329"
DOCKER_CONTAINER_NAME="container-from-outside-terraform"
TERRAFORM_IMPORT_FILE="import.tf"
TERRAFORM_GENERATED_FILE="generated.tf"

# clean up old import attemps
rm "${TERRAFORM_IMPORT_FILE}" "${TERRAFORM_GENERATED_FILE}"

# pull image
docker \
  pull \
    --quiet \
    "${DOCKER_IMAGE}"

# clean up old container
# see https://docs.docker.com/reference/cli/docker/container/rm/
docker \
  container \
    remove \
      --force \
      --volumes \
      "${DOCKER_CONTAINER_NAME}"

# run container
# see https://docs.docker.com/reference/cli/docker/container/run/
docker \
  container \
    run \
      --name "${DOCKER_CONTAINER_NAME}" \
      --quiet \
      "${DOCKER_IMAGE}"

# print full ID of container for import
# see https://docs.docker.com/reference/cli/docker/container/ls/
DOCKER_CONTAINER_ID=$(docker \
  container \
    list \
      --all \
      --filter "name=${DOCKER_CONTAINER_NAME}" \
      --format '{{.ID}}' \
      --no-trunc)

echo "\nContainer ID: \`${DOCKER_CONTAINER_ID}\`"
echo "Contents of \`${TERRAFORM_IMPORT_FILE}\`:\n"

# render import configuration
cat <<EOF > "${TERRAFORM_IMPORT_FILE}"
# see https://developer.hashicorpdo.com/terraform/language/import
# and https://developer.hashicorp.com/terraform/language/import/generating-configuration
import {
  to = docker_container.importable-${DOCKER_CONTAINER_NAME}
  id = "${DOCKER_CONTAINER_ID}"
}

# 1.) generate configuration using \`terraform plan -generate-config-out=${TERRAFORM_GENERATED_FILE}\`
# 2.) inspect `${TERRAFORM_GENERATED_FILE}` and make any necessary modifications
# 3.) apply the newly generated configuration using \`terraform apply\`
# 4.) when finished, delete \`${TERRAFORM_IMPORT_FILE}\`
EOF

# print import configuration
cat "${TERRAFORM_IMPORT_FILE}"
