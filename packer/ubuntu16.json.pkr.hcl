variable "yandex_folder_id" {
  type    = string
  default = ""
}

variable "yandex_service_account_key_file" {
  type    = string
  default = ""
}

variable "yandex_source_image_family" {
  type    = string
  default = ""
}

locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

source "yandex" "reddit" {
  folder_id                = "${var.yandex_folder_id}"
  image_family             = "reddit-base"
  image_name               = "reddit-base-${local.timestamp}"
  platform_id              = "standard-v1"
  service_account_key_file = "${var.yandex_service_account_key_file}"
  source_image_family      = "${var.yandex_source_image_family}"
  ssh_username             = "ubuntu"
  use_ipv4_nat             = true
}

build {
  sources = ["source.yandex.reddit"]

  provisioner "shell" {
    execute_command = "sudo {{ .Path }}"
    script          = "scripts/install_ruby.sh"
  }

  provisioner "shell" {
    execute_command = "sudo {{ .Path }}"
    script          = "scripts/install_mongodb.sh"
  }

}
