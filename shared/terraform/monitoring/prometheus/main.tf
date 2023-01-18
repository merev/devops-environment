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

resource "docker_image" "img-prometheus" {
  name = "prom/prometheus:latest"
}

resource "docker_container" "con-prometheus" {
  name = "prometheus"
  image = docker_image.img-prometheus.name
  ports {
    internal = "9090"
    external = "9090"
  }
  mounts {
    type = "bind"
    source = "/home/vagrant/prometheus/prometheus.yml"
    target = "/etc/prometheus/prometheus.yml"
  }
}