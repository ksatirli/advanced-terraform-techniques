#!/bin/sh

# This is a Terraform-generated file.
# Manual changes will be overwritten.

wget -O- ${REPO_KEY} | gpg --dearmor | sudo tee /usr/share/keyrings/${REPO_IDENTIFIER}-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/${REPO_IDENTIFIER}-keyring.gpg] ${REPO_URL} $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/${REPO_IDENTIFIER}.list
