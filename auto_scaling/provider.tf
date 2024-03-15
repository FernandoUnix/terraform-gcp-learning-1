variable "path" {
  default =  "C:/Users/ad/Downloads/terraform/terraform"
}

provider "google" {
  project = "silicon-clock-417122"
  region = "us-central1"
  credentials = "${file("${var.path}/credentials.json")}"
}