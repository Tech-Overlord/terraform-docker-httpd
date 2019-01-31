# Running a docker container with terraform ID iamghostcontainerID.
resource "docker_container" "iamghostcontainerID"
{
  name = "${var.name_of_container}"
  image = "${var.name_of_image}"
  ports
  {
    internal = "${var.port_of_internal}"
    external = "${var.port_of_external}"
  }
}