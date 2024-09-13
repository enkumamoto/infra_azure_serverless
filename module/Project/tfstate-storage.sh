#!/bin/bash

# Script para criar um storage account para armazenar o tfstate. Edite com suas informações.
echo "Iniciando expotação de variáveis de ambiente..."
echo "###############################################"
export RESOURCE_GROUP_NAME=RG-Blackstone-Storage_TFstate
export STORAGE_ACCOUNT_NAME=BLKSTNtfstatstorageaccount
export CONTAINER_NAME=blackstonetfstate
export REGION=eastus
export TAGS='managedBy=eiji.kumamoto@radixeng.com'

# # Colocar as informações do Service Principal no valores das varaiáveis de ambiente.
# echo "Exportando variáveis de ambiente para Service Principal..."
# echo "##########################################################"
# export ARM_CLIENT_ID=ARM_CLIENT_ID
# export ARM_CLIENT_SECRET=ARM_CLIENT_SECRET.DDdhr
# export ARM_TENANT_ID=ARM_TENANT_ID
# export ARM_SUBSCRIPTION_ID=ARM_SUBSCRIPTION_ID

# # Login para Azure
# az login --service-principal -u ${ARM_CLIENT_ID} -p ${ARM_CLIENT_SECRET} --tenant ${ARM_TENANT_ID}
# az account set --subscription ${ARM_SUBSCRIPTION_ID}

# Criando resource group
az group create --name $RESOURCE_GROUP_NAME --location $REGION --tags $TAGS

# Criando storage account
az storage account create --resource-group $RESOURCE_GROUP_NAME --name $STORAGE_ACCOUNT_NAME --sku Standard_LRS --encryption-services blob --tags $TAGS

# Criando blob container
az storage container create --name $CONTAINER_NAME --account-name $STORAGE_ACCOUNT_NAME --auth-mode login
