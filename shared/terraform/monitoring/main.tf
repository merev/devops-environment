terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}
provider "docker" {
  host = "tcp://192.168.99.104:2375/"
}

module "prometheus" {
  source = "./prometheus"
}

module "grafana" {
  source = "./grafana"
}