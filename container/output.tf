# Output certain properties

output "IP_Address"
{
  value = "${docker_container.iamghostcontainerID.ip_address}"
}

output "Container_Name"
{
  value = "${docker_container.iamghostcontainerID.name}"
}

output "Container_ID"
{
  value = "${docker_container.iamghostcontainerID.id}"
}