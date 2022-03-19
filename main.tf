terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "0.61.0"
    }
  }
  backend "s3" {
        endpoint   = "storage.yandexcloud.net"
        bucket     = "rybalka-dmitrii-chapter-7-lesson-1"
        region     = "ru-central1-a"
        key        = "terraform_state.tfstate"
        # access_key = var.access_key
        # secret_key = var.secret_key
        skip_region_validation      = true
        skip_credentials_validation = true
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
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.yml")}"
  }
}

output "ip_address" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
