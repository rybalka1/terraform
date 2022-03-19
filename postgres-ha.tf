# resource "yandex_mdb_postgresql_cluster" "pg-ha-rybalka-dmitrii" {
#   name        = "pg-ha-rybalka-dmitrii"
#   environment = "PRODUCTION"
#   network_id  = "enpot3mekd83n12r9d0s"

#   config {
#     version = 13
#     resources {
#       resource_preset_id = "s2.micro"
#       disk_type_id       = "network-ssd"
#       disk_size          = 16
#     }
#   }

#   maintenance_window {
#     type = "ANYTIME"
#   }

#   database {
#     name  = "ha-ya-practics"
#     owner = "student"
#   }

#   user {
#     name     = "student"
#     password = "ha-rybalka_dmitrii"
#     permission {
#       database_name = "ha-ya-practics"
#     }
#   }

#   user {
#     name     = "read_user"
#     password = "read_user_pass"
#     permission {
#       database_name = "ha-ya-practics"
#     }
#   }

#   user {
#     name     = "write_user"
#     password = "write_user_pass"
#     permission {
#       database_name = "ha-ya-practics"
#     }
#   }
#   user {
#     name     = "admin_user"
#     password = "admin_user_pass"
#     permission {
#       database_name = "ha-ya-practics"
#     }
#   }
#   host {
#     zone             = "ru-central1-a"
#     subnet_id        = "e9b56isq2ac2jfev6np3"
#     assign_public_ip = true
#   }

#   host {
#     zone             = "ru-central1-a"
#     subnet_id        = "e9b56isq2ac2jfev6np3"
#     assign_public_ip = true
#   }
# }

# # resource "yandex_vpc_network" "foo" {}

# # resource "yandex_vpc_subnet" "foo" {
# #   zone           = "ru-central1-a"
# #   network_id     = yandex_vpc_network.foo.id
# #   v4_cidr_blocks = ["10.1.0.0/24"]
# # }

# # resource "yandex_vpc_subnet" "bar" {
# #   zone           = "ru-central1-b"
# #   network_id     = yandex_vpc_network.foo.id
# #   v4_cidr_blocks = ["10.2.0.0/24"]
# # }
