resource "yandex_mdb_postgresql_cluster" "pg-rybalka-dmitrii" {
  name        = "pg-rybalka-dmitrii"
  environment = "PRODUCTION"
  network_id  = "enpot3mekd83n12r9d0s"

  config {
    version = 13
    resources {
      resource_preset_id = "b2.nano"
      disk_type_id       = "network-ssd"
      disk_size          = 10
    }
  }

  database {
    name  = "ya-practics"
    owner = "student"
  }

  user {
    name       = "student"
    password   = "rybalka_dmitrii"
    conn_limit = 50
    permission {
      database_name = "ya-practics"
    }
    settings = {
      default_transaction_isolation = "read committed"
      log_min_duration_statement    = 5000
    }
  }

  host {
    zone             = var.ya_zone
    subnet_id        = "e9b56isq2ac2jfev6np3"
    assign_public_ip = true
  }
}

# resource "yandex_vpc_network" "pg-rybalka-dmitrii" {name = "rybalka-lan"}

# resource "yandex_vpc_subnet" "pg-rybalka-dmitrii" {
#   zone       = "ru-central1-a"
#   network_id = "e9b56isq2ac2jfev6np3"
#     v4_cidr_blocks = ["10.122.0.0/24"]
# }
