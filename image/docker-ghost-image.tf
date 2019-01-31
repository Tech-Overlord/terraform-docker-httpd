# Downloading ghost's latest docker image and calling it as myghostimage in Terraform. This is Terraform's way of saying "docker pull ghost:latest"
resource "docker_image" "myghostimage"
{
  name = "${var.image_of_container}"
}