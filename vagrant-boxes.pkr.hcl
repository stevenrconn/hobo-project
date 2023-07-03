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


source "virtualbox-iso" "rockylinux8" {
    guest_os_type    = "RedHat8_64"
    iso_url          = "https://download.rockylinux.org/pub/rocky/8/isos/x86_64/Rocky-x86_64-boot.iso"
    iso_checksum     = "96c9d96c33ebacc8e909dcf8abf067b6bb30588c0c940a9c21bb9b83f3c99868"
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
    iso_url          = "https://download.rockylinux.org/pub/rocky/9/isos/x86_64/Rocky-x86_64-boot.iso"
    iso_checksum     = "11e42da96a7b336de04e60d05e54a22999c4d7f3e92c19ebf31f9c71298f5b42"
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
    iso_url          = "https://releases.ubuntu.com/20.04.6/ubuntu-20.04.6-live-server-amd64.iso"
    iso_checksum     = "b8f31413336b9393ad5d8ef0282717b2ab19f007df2e9ed5196c13d8f9153c8b"
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
    iso_url          = "https://mirrors.tripadvisor.com/releases/22.04.2/ubuntu-22.04.2-live-server-amd64.iso"
    iso_checksum     = "5e38b55d57d94ff029719342357325ed3bda38fa80054f9330dc789cd2d43931"
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