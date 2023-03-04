terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "react-docker-image" {
  name         = "jackbrowne00/react-docker:latest"
  keep_locally = false
}

resource "docker_container" "react-docker-container" {
  image = docker_image.react-docker-image.latest
  name  = "react-docker-container"
  ports {
    internal = 80
    external = 8080
  }
}
