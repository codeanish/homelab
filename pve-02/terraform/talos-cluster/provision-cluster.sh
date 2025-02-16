terraform apply -var-file="control-plane-01.tfvars" -auto-approve
terraform apply -var-file="control-plane-02.tfvars" -auto-approve
terraform apply -var-file="worker-01.tfvars" -auto-approve
terraform apply -var-file="worker-01.tfvars" -auto-approve
terraform apply -var-file="worker-01.tfvars" -auto-approve