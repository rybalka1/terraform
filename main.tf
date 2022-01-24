terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson3-rybalka-dmitrii"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.ya_image_id
    }
  }

  network_interface {
    subnet_id = var.ya_subnet_id
    nat       = false
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
