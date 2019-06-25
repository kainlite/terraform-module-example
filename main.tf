# Set the provider
provider "google" {
  credentials = "${file("account.json")}"
  project     = "${var.project_name}"
  region      = "${var.region}"
}

variable "project_name" {
  default = "testinggcp"
  type    = "string"
}

variable "cluster_name" {
  default = "demo-terraform-cluster"
  type    = "string"
}

variable "region" {
  default = "us-east1"
  type    = "string"
}

variable "zone" {
  default = "us-east1-c"
  type    = "string"
}

# Call our module
module "terraform-gke" {
  source = "./module"
  zone = "${var.zone}"
  cluster_name = "${var.cluster_name}"
}

output "kubernetes-version" {
  value = module.terraform-gke.k8s_master_version
}
