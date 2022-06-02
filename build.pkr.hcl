
variable "project_id" {
    type = string
}

variable "source_image_family" {
    type = string
}

variable "ssh_username" {
    type = string
}

variable "zone" {
    type = string
}

variable "subnetwork" {
    type = string
}

variable "image_sufix" {
    type = string
}

locals {
  packerstarttime = formatdate("YYYY-MM-DD-hhmm", timestamp())
}

source "googlecompute" "getapug-instance" {
    image_name = "${var.image_sufix}-${local.packerstarttime}"
    image_family = var.image_sufix
    project_id = var.project_id
    source_image_family = var.source_image_family
    ssh_username = var.ssh_username
    zone = var.zone
    omit_external_ip = true
    use_internal_ip = true
    use_os_login = true
    use_iap = true
    subnetwork = var.subnetwork
}
  
build {
  sources = ["sources.googlecompute.getapug-instance"]

    provisioner "shell" {
        inline = [
            "sudo yum install ansible -y",
            "mkdir /tmp/packer-ansible-provisioner/"
        ]
    }

    provisioner "file" {
        source = "./ansible/"
        destination = "/tmp/packer-ansible-provisioner/"
    }

    /*provisioner "shell" {
        inline = ["sudo mkdir /test","sudo touch /test/testfile.txt"]
    }*/

    provisioner "ansible-local" {
        playbook_file   = "/tmp/packer-ansible-provisioner/playbook.yaml"
        extra_arguments = []
    }
}