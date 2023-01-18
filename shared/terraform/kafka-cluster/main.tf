terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
    }
  }
}
provider "docker" {
  host = "tcp://192.168.99.103:2375/"
}

resource "docker_network" "kafka-main-network" {
  name = "kakfa-net"
  driver = "bridge"
}

resource "docker_image" "img-zookeeper" {
  name = "confluentinc/cp-zookeeper:latest"
}

resource "docker_image" "img-broker" {
  name = "confluentinc/cp-kafka:latest"
}

resource "docker_image" "img-facts-consumer" {
  name = "merev/kafka-consumer:facts"
}

resource "docker_image" "img-facts-producer" {
  name = "merev/kafka-producer:facts"
}

resource "docker_container" "con-zookeeper" {
  name = "zookeeper"
  image = docker_image.img-zookeeper.name
  env = [
    "ZOOKEEPER_CLIENT_PORT=2181", 
    "ZOOKEEPER_TICK_TIME=2000"
  ]
  networks_advanced {
    name = docker_network.kafka-main-network.name
  }
  ports {
    internal = "2181"
    external = "22181"
  }
  restart = "always"
}

resource "docker_container" "con-broker" {
  name = "broker"
  image = docker_image.img-broker.name
  env = [
    "KAFKA_BROKER_ID=1", 
    "KAFKA_ZOOKEEPER_CONNECT=zookeeper:2181", 
    "KAFKA_ADVERTISED_LISTENERS=PLAINTEXT://localhost:9092,PLAINTEXT_INTERNAL://broker:29092", 
    "KAFKA_LISTENER_SECURITY_PROTOCOL_MAP=PLAINTEXT:PLAINTEXT,PLAINTEXT_INTERNAL:PLAINTEXT", 
    "KAFKA_INTER_BROKER_LISTENER_NAME=PLAINTEXT", 
    "KAFKA_OFFSETS_TOPIC_REPLICATION_FACTOR=1"
  ]
  networks_advanced {
    name = docker_network.kafka-main-network.name
  }
  ports {
    internal = "9092"
    external = "9092"
  }
  restart = "always"
}

resource "docker_container" "con-facts-consumer" {
  name = "facts-consumer"
  image = docker_image.img-facts-consumer.name
  env = ["BROKER=broker:29092", "TOPIC=demo2"]
  networks_advanced {
    name = docker_network.kafka-main-network.name
  }
  restart = "always"
}

resource "docker_container" "con-facts-producer" {
  name = "facts-producer"
  image = docker_image.img-facts-producer.name
  env = ["BROKER=broker:29092", "TOPIC=demo2"]
  networks_advanced {
    name = docker_network.kafka-main-network.name
  }
  restart = "always"
}
