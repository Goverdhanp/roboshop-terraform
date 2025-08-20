dev-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-dev/main.tfvars
	terraform apply -auto-approve -var-file =env-dev/main.tfvars
dev-destroy:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-dev/main.tfvars
	terraform destroy -auto-approve -var-file =env-dev/main.tfvars

prod-apply:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-prod/main.tfvars
	terraform apply -auto-approve -var-file =env-prod/main.tfvars
prod-destroy:
	git pull
	rm -f .terraform/terraform.tfstate
	terraform init -backend-config=env-prod/main.tfvars
	terraform destroy -auto-approve -var-file =env-prod/main.tfvars

