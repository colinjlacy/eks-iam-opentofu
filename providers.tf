

terraform {
  required_version = "1.6.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.16.0"
    }
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "kubernetes" {
  host = data.aws_eks_cluster.selected.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.selected.certificate_authority[0].data)
  token = data.aws_eks_cluster_auth.selected.token
}