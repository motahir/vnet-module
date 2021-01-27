variable "name" {
  default = ""
}

variable "location" {
  default = ""
}

variable "address_space" {
  type    = "list"
  default = []
}

variable "service_endpoints" {
  type    = "list"
  default = []
}

variable "subnet_prefixes" {
  default = []
}

variable "subnet_names" {
  default = []
}

variable "env" {
  default = ""
}
