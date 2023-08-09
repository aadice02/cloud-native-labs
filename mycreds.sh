export ARM_CLIENT_ID=$(az keyvault secret show --name "ARM-CLIENT-ID" --vault-name "kv-ag-tf" --query "value" -o tsv)
export ARM_CLIENT_SECRET=$(az keyvault secret show --name "ARM-CLIENT-SECRET" --vault-name "kv-ag-tf" --query "value" -o tsv)
export ARM_SUBSCRIPTION_ID=$(az keyvault secret show --name "ARM-SUBSCRIPTION-ID" --vault-name "kv-ag-tf" --query "value" -o tsv)
export ARM_TENANT_ID=$(az keyvault secret show --name "ARM-TENANT-ID" --vault-name "kv-ag-tf" --query "value" -o tsv)
