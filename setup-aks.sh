
terraform init
terraform apply -auto-approve


export KUBECONFIG=$(terraform output kube_config)


echo "AKS Cluster Name: $(terraform output cluster_name)"

az account set --subscription 2600ef59-0249-4a9f-af1c-68655b8143bf

az aks get-credentials --resource-group tRessourceGroup --name tAKSCluster