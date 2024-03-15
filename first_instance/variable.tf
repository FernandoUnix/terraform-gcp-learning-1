variable "image" {
  default = "debian-12-bookworm-v20240213"
}

variable "machine_type" {default = "e2-medium"}

variable "machine_type_dev" {default = "e2-medium"}

# variable "machine_type" { #map example
#     type = "map"
#     default =  {
#         "dev" = "e2-medium"
#         "prod" = "e2-medium"
#     }
  
# }

variable "enviroment" {
  default = "production"
}


variable "name_count" {
  default = ["server1", "server2", "server3"] #list example
}

