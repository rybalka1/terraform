terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
}

resource "yandex_compute_instance" "vm-1" {
  name = "chapter5-lesson2-rybalka-dmitrii"

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd80qm01ah03dkqb14lc"
    }
  }

  network_interface {
    subnet_id = "e9bd4vf8tm60md55lp0k"
    nat       = false
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
