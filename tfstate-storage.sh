#!/bin/bash

SUBSCRIPTION_ID=$(az account show --query id -o tsv)
# ARM_TENANT_ID=$(az account show --query homeTenantId -o tsv)
# ARM_CLIENT_ID=$(az account show --query clientId -o tsv)
# ARM_CLIENT_SECRET=$(az account show --query clientSecret -o tsv)


# Script para criar um storage account para armazenar o tfstate. Edite com suas informações.
echo "Iniciando expotação de variáveis de ambiente..."
echo "###############################################"
export RESOURCE_GROUP_NAME="RG-obsidian-Storage_TFstate"
export STORAGE_ACCOUNT_NAME="obsidiantfstatestg"
export CONTAINER_NAME="obsidiantfstate"
export REGION="eastus"
export TAGS="managedBy=EijiKumamoto"

# # Colocar as informações do Service Principal no valores das varaiáveis de ambiente.
# echo "Exportando variáveis de ambiente para Service Principal...""
# echo "##########################################################""
# export ARM_CLIENT_ID=ARM_CLIENT_ID
# export ARM_CLIENT_SECRET=ARM_CLIENT_SECRET.DDdhr
# export ARM_TENANT_ID=ARM_TENANT_ID
export ARM_SUBSCRIPTION_ID=ARM_SUBSCRIPTION_ID

# export ARM_ACCESS_KEY=$(az keyvault secret show --name obsidian-terraform-backend-key --vault-name obsidianKeyVault --query value -o tsv)

ACCOUNT_KEY=$(az storage account keys list --resource-group $RESOURCE_GROUP_NAME --account-name $STORAGE_ACCOUNT_NAME --query '[0].value' -o tsv)
export ARM_ACCESS_KEY=$ACCOUNT_KEY

# Login para Azure
# az login --service-principal -u ${ARM_CLIENT_ID} -p ${ARM_CLIENT_SECRET} --tenant ${ARM_TENANT_ID}
az account set --subscription ${SUBSCRIPTION_ID}

# Criando resource group
az group create --name $RESOURCE_GROUP_NAME --location $REGION --tags $TAGS

# Criando storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob --tags $TAGS

# Criando blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --auth-mode login

