resource "docker_image" "httpd-image-resource" {
  name = local.image_name
}

resource "docker_container" "httpd-container-resource" {
  name  = local.container_name
  image = local.image_name
  ports {
    internal = local.int_port
    external = local.ext_port
  }
}

