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

resource "docker_image" "img-grafana" {
  name = "grafana/grafana:latest"
}

resource "docker_container" "con-grafana" {
  name = "grafana"
  image = docker_image.img-grafana.name
  ports {
    internal = "3000"
    external = "3000"
  }
}