output "zookeeper-name" {
  value = docker_container.con-zookeeper.name
}

output "zookeeper-id" {
  value = docker_container.con-zookeeper.id
}

output "broker-name" {
  value = docker_container.con-broker.name
}

output "broker-id" {
  value = docker_container.con-broker.id
}

output "facts-consumer-name" {
  value = docker_container.con-facts-consumer.name
}

output "facts-consumer-id" {
  value = docker_container.con-facts-consumer.id
}

output "facts-producer-name" {
  value = docker_container.con-facts-producer.name
}

output "facts-producer-id" {
  value = docker_container.con-facts-producer.id
}