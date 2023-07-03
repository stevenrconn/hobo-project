variable "packer_http_ip" {
    type = string
    default = "{{ .HTTPIP }}"
}

variable "packer_headless" {
    type = bool
    default = true
}

variable "box_memory" {
    type = number
    default = 2048
}

variable "box_cpus" {
    type = number
    default = 1
}

variable "box_disk_size" {
    type = number
    default = 32768
}

variable "box_nic_type" {
    type = string
}

variable "vagrant_ssh_pubkey" {
    type = string
    sensitive = true
}

variable "iso" {
    type = map(object({
        url = string
        checksum = string
    }))
}


source "virtualbox-iso" "rockylinux8" {
    guest_os_type    = "RedHat8_64"
    iso_url          = "${var.iso.rockylinux8.url}"
    iso_checksum     = "${var.iso.rockylinux8.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}" 
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=http://${var.packer_http_ip}:{{ .HTTPPort }}/ks-rockylinux8.cfg",
        "<enter>"
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "rockylinux9" {
    guest_os_type    = "RedHat9_64"
    iso_url          = "${var.iso.rockylinux9.url}"
    iso_checksum     = "${var.iso.rockylinux9.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}" 
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up><tab>",
        " fips=1",
        " inst.ks=http://${var.packer_http_ip}:{{ .HTTPPort }}/ks-rockylinux9.cfg",
        "<enter>"
    ]
    headless = var.packer_headless
}

source "virtualbox-iso" "ubuntu20lts" {
    guest_os_type    = "Ubuntu20_LTS_64"
    iso_url          = "${var.iso.ubuntu20lts.url}"
    iso_checksum     = "${var.iso.ubuntu20lts.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}" 
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "5s"
    boot_command     = [
        "<enter><enter><f6><esc><wait> ",
        "autoinstall ds=nocloud-net;s=http://${var.packer_http_ip}:{{ .HTTPPort }}/",
        "<enter>"   
    ]
    headless         = var.packer_headless
}

source "virtualbox-iso" "ubuntu22lts" {
    guest_os_type    = "Ubuntu22_LTS_64"
    iso_url          = "${var.iso.ubuntu22lts.url}"
    iso_checksum     = "${var.iso.ubuntu22lts.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    nic_type         = "${var.box_nic_type}" 
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "5s"
    boot_command     = [
        "c",
        "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://${var.packer_http_ip}:{{ .HTTPPort }}/'",
        "<enter><wait>",
        "initrd /casper/initrd<enter><wait>",
        "boot<enter>"   
    ]
    headless         = var.packer_headless
}


build {
    sources = [ 
        "source.virtualbox-iso.rockylinux8",
        "source.virtualbox-iso.rockylinux9",
        "source.virtualbox-iso.ubuntu20lts",
        "source.virtualbox-iso.ubuntu22lts"
    ]

    provisioner "shell" {
        execute_command = "sudo -S sh -c '{{ .Vars }} {{ .Path }}'"
        inline = [
            "set -o xtrace",
            "hostnamectl set-hostname ${source.name}",
            "mkdir --parents /home/vagrant/.ssh",
            "echo \"${var.vagrant_ssh_pubkey}\" >> /home/vagrant/.ssh/authorized_keys",
            "chown -R vagrant:vagrant /home/vagrant/.ssh",
            "chmod -R go-rwX /home/vagrant/.ssh"
        ]
    }

    post-processor "vagrant" {
        output = "${path.root}/boxes/{{ .BuildName }}-{{ .Provider }}.box"
    }
}