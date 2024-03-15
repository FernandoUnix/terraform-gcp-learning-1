resource "google_compute_instance" "default" {
  #count = "${length(var.name_count)}"
  count = "1"
  name = "vm-${count.index+1}"
  machine_type = "${var.enviroment == "production" ? var.machine_type : var.machine_type_dev}" #if example
  #machine_type = var.machine_type["dev"]
  zone = "us-central1-a"

    boot_disk {
        initialize_params {
            image =  var.image
        }
    }

    network_interface {
        network = "default"
    }

    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}

# resource "google_compute_instance" "second" {
#   #count = "${length(var.name_count)}"
#   count = "1"
#   name = "vm-${count.index+1}"
#   machine_type = var.machine_type["dev"]
#   zone = "us-central1-a"

#     boot_disk {
#         initialize_params {
#             image =  var.image
#         }
#     }

#     network_interface {
#         network = "default"
#     }

#     service_account {
#         scopes = ["userinfo-email", "compute-ro", "storage-ro"]
#     }

#     depends_on = [ "google_compute_instance.default" ]
# }

#output "machine_type" { value = "${google_compute_instance.default.*.machine_type}" }

#output "name" { value = "${google_compute_instance.default.*.name}" }

#output "zone" { value = "${google_compute_instance.default.*.zone}" }

#output "instance_id" { value = "${join(",", google_compute_instance.default.*.id)}" } #join list example
