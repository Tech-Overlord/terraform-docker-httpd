# Output certain properties

output "Image_Name"
{
  value = "${var.image_of_container}"
}

output "Image_ID"
{
  value = "${docker_image.myghostimage.latest}"
}