# Provision the AKS cluster with Terraform
terraform init
terraform apply -auto-approve

# Export the KUBECONFIG environment variable
export KUBECONFIG=$(terraform output kube_config)

# Display the AKS cluster name
echo "AKS Cluster Name: $(terraform output cluster_name)"