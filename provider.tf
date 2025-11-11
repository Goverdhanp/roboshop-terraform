provider "aws"{
    region= "us-east-1"
} 


provider "vault" {
  address = "http://vault.gvndevops12.tech:8200"
  token   = var.vault_token
}

