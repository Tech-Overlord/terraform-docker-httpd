# This modules calls on ./image and utilizes the resources within it.
module "ofImage"
{
  source = "./image"
  image_of_container = "${lookup(var.container_image, var.env)}"
}

# This modules calls on ./container and utilizes the resources within it. Variables assigned in main_variables are being picked by the module below and using the defined variables in the module below is being inherited within the modules.
module "ofContainer"
{
  source = "./container"
  name_of_image = "${module.ofImage.Image_Name}"
  name_of_container = "${lookup(var.container_name, var.env)}"
  port_of_internal = "${lookup(var.int_port, var.env)}"
  port_of_external = "${lookup(var.ext_port, var.env)}"
}