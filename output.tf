# Output certain properties

output "Name_of_Docker-Image_used"
{
  value = "${module.ofImage.Image_Name}"
}

output "ID_of_Docker-Image_used"
{
  value = "${module.ofImage.Image_ID}"
}

output "Name_of_Docker_container_created"
{
  value = "${module.ofContainer.Container_Name}"
}

output "ID_of_Docker_container_created"
{
  value = "${module.ofContainer.Container_ID}"
}