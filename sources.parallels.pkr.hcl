source "parallels-iso" "rockylinux9" {
    guest_os_type    = "redhat"
    iso_url          = "${var.iso.rockylinux9.aarch64.url}"
    iso_checksum     = "${var.iso.rockylinux9.aarch64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up>e<down><down><end>",
        " fips=1",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rockylinux9.aarch64.cfg",
        "<f10>"
    ]
    parallels_tools_flavor = "lin-arm"
    parallels_tools_guest_path = "/home/vagrant/prl-tools.iso"
}

source "parallels-iso" "rockylinux9-minimal" {
    guest_os_type    = "redhat"
    iso_url          = "${var.iso.rockylinux9.aarch64.url}"
    iso_checksum     = "${var.iso.rockylinux9.aarch64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_command     = [
        "<up>e<down><down><end>",
        " fips=1",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-rockylinux9-minimal.aarch64.cfg",
        "<f10>"
    ]
    parallels_tools_flavor = "lin-arm"
    parallels_tools_guest_path = "/home/vagrant/prl-tools.iso"
}

source "parallels-iso" "fedora40" {
    iso_url          = "${var.iso.fedora40.aarch64.url}"
    iso_checksum     = "${var.iso.fedora40.aarch64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "15s"
    boot_command     = [
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora40.cfg<f10>"   
    ]
    parallels_tools_flavor = "lin-arm"
    parallels_tools_guest_path = "/home/vagrant/prl-tools.iso"
}

source "parallels-iso" "fedora40-minimal" {
    iso_url          = "${var.iso.fedora40.aarch64.url}"
    iso_checksum     = "${var.iso.fedora40.aarch64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "15s"
    boot_command     = [
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora40-minimal.cfg<f10>"   
    ]
    parallels_tools_flavor = "lin-arm"
    parallels_tools_guest_path = "/home/vagrant/prl-tools.iso"
}

source "parallels-iso" "fedora41" {
    iso_url          = "${var.iso.fedora41.aarch64.url}"
    iso_checksum     = "${var.iso.fedora41.aarch64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "15s"
    boot_command     = [
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora41.cfg<f10>"   
    ]
    parallels_tools_flavor = "lin-arm"
    parallels_tools_guest_path = "/home/vagrant/prl-tools.iso"
}

source "parallels-iso" "fedora41-minimal" {
    iso_url          = "${var.iso.fedora41.aarch64.url}"
    iso_checksum     = "${var.iso.fedora41.aarch64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "15s"
    boot_command     = [
        "<up>e<wait><down><down><end>",
        " inst.ks=http://${var.packer_httpip}:{{ .HTTPPort }}/ks-fedora41-minimal.cfg<f10>"   
    ]
    parallels_tools_flavor = "lin-arm"
    parallels_tools_guest_path = "/home/vagrant/prl-tools.iso"
}

source "parallels-iso" "ubuntu-jammy" {
    guest_os_type    = "ubuntu"
    iso_url          = "${var.iso.ubuntu-jammy.aarch64.url}"
    iso_checksum     = "${var.iso.ubuntu-jammy.aarch64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "5s"
    boot_command     = [
        "c",
        "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://${var.packer_httpip}:{{ .HTTPPort }}/'",
        "<enter><wait>",
        "initrd /casper/initrd<enter><wait>",
        "boot<enter>"   
    ]
    parallels_tools_flavor = "lin-arm"
    parallels_tools_guest_path = "/home/vagrant/prl-tools.iso"
}

source "parallels-iso" "ubuntu-noble" {
    guest_os_type    = "ubuntu"
    iso_url          = "${var.iso.ubuntu-noble.aarch64.url}"
    iso_checksum     = "${var.iso.ubuntu-noble.aarch64.checksum}"
    cpus             = var.box_cpus
    memory           = var.box_memory
    disk_size        = var.box_disk_size
    ssh_username     = "vagrant"
    ssh_password     = "vagrant"
    ssh_timeout      = "30m"
    shutdown_command = "sudo -S systemctl poweroff"
    http_directory   = "${path.root}"
    boot_wait        = "5s"
    boot_command     = [
        "c",
        "linux /casper/vmlinuz --- autoinstall ds='nocloud-net;s=http://${var.packer_httpip}:{{ .HTTPPort }}/'",
        "<enter><wait>",
        "initrd /casper/initrd<enter><wait>",
        "boot<enter>"   
    ]
    parallels_tools_flavor = "lin-arm"
    parallels_tools_guest_path = "/home/vagrant/prl-tools.iso"
}

