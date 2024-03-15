locals {
  #name = "vm-${var.name1}-${var.name2}-${var.name3}"
}

resource "google_compute_instance" "default" {
  #count = "${length(var.name_count)}"
  count = "${var.machine_count}"
  #name = "${locals.name}"
  name = "vm-${count.index+1}"
  machine_type = "${var.enviroment == "production" ? var.machine_type : var.machine_type_dev}" #if example
  #machine_type = var.machine_type["dev"]
  zone = "us-central1-a"
  can_ip_forward = "false"
  description = "This is our virtual machine"

    tags = ["allow-http", "allow-https"] #Firewall

    boot_disk {
        initialize_params {
            image =  var.image
            size = "20"
        }
    }

    labels = {
        name =  "vm-${count.index+1}"
        machine_type = "${var.enviroment == "production" ? var.machine_type : var.machine_type_dev}"
    }

    network_interface {
        network = "default"
    }

    metadata = {
      size = "20"
      foo = "bar"
    }

    metadata_startup_script = "echo hi > /test.txt" #any script or path

    service_account {
        scopes = ["userinfo-email", "compute-ro", "storage-ro"]
    }
}

resource "google_compute_disk" "default" {
    name = "test-desk"
    type = "pd-ssd"
    zone = "us-central1-a"
    size = 10
}

resource "google_compute_attached_disk" "default" {
  disk = "${google_compute_disk.default.self_link}"
  instance = "${google_compute_instance.default.self_link}"
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
