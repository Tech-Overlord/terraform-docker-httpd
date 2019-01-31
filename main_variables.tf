# Setting variables to utilize.
variable "env"
{
  description = "environment can be dev or prod"
}


variable "container_image"
{
  description = "This is the image for container"
  type = "map"
  default =
  {
    dev = "httpd:latest"
    prod = "httpd:latest"
  }
}

variable "container_name"
{
  description = "This is the name for container"
  type = "map"
  default
  {
    dev = "dev_apache"
    prod = "prod_apache"
  }
}

variable "int_port"
{
  description = "This is the internal port for container"
  type = "map"
  default
  {
    dev = "80"
    prod = "80"
  }
}

variable "ext_port"
{
  description = "This is the external port for container"
  type = "map"
  default
  {
    dev = "80"
    prod = "80"
  }
}
