resource "docker_container" "database" {
  name  = "database"
  image = "postgres:16"
  ports {
    internal = 5432
    external = var.bd_port[terraform.workspace]
  }

env = [
  "POSTGRES_USER=upao",
  "POSTGRES_PASSWORD=upao",
]

    networks_advanced {
    name = docker_network.app_network.name
  }
}